<?php

require('Classes/PHPExcel.php');
require('connect/db_connect.php');

if(isset($_POST['btnExport'])){
	$objExcel = new PHPExcel;
	$objExcel->setActiveSheetIndex(0);
	$sheet = $objExcel->getActiveSheet()->setTitle('10A1');

	$rowCount = 1;
	$sheet->setCellValue('A'.$rowCount,'Tran_ID');
	$sheet->setCellValue('B'.$rowCount,'ID');
	$sheet->setCellValue('C'.$rowCount,'ProductID');
	$sheet->setCellValue('D'.$rowCount,'Qty');
	$sheet->setCellValue('E'.$rowCount,'Amount');
	$sheet->setCellValue('F'.$rowCount,'Data');
	$sheet->setCellValue('G'.$rowCount,'Status');
	

	// $result = $mysqli->query("SELECT diem.name,toan,ly,hoa FROM diem INNER JOIN lop ON lop.id=diem.id_lop WHERE lop.name='10A1'");
	$result = $mysqli->query("SELECT * FROM `order` ORDER BY `order`.`transaction_id` ASC");
	while($row = mysqli_fetch_array($result)){
		$rowCount++;
		$sheet->setCellValue('A'.$rowCount,$row['transaction_id']);
		$sheet->setCellValue('B'.$rowCount,$row['id']);
		$sheet->setCellValue('C'.$rowCount,$row['product_id']);
		$sheet->setCellValue('D'.$rowCount,$row['qty']);
		$sheet->setCellValue('E'.$rowCount,$row['amount']);
		$sheet->setCellValue('F'.$rowCount,$row['data']);
		$sheet->setCellValue('G'.$rowCount,$row['status']);
		

		
	}

	$objWriter = new PHPExcel_Writer_Excel2007($objExcel);
	$filename = 'exportData.xlsx';
	$objWriter->save($filename);

	header('Content-Disposition: attachment; filename="' . $filename . '"');  
	header('Content-Type: application/vnd.openxmlformatsofficedocument.spreadsheetml.sheet');  
	header('Content-Length: ' . filesize($filename));  
	header('Content-Transfer-Encoding: binary');  
	header('Cache-Control: must-revalidate');  
	header('Pragma: no-cache');  
	readfile($filename);  
	return;

}


?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Export data</title>
	<link rel="stylesheet" href="">
</head>
<body>
	<form method="POST">
		<button name="btnExport" type="submit">Xuất file</button>
	</form>
</body>
</html>