data local_file test  {
  filename = "../for1.tf" 
}




output testcontent {
value = data.local_file.test.id
}

resource local_file  test_file {
  filename = join("_",[data.local_file.test.filename, "1"] )
  content = data.local_file.test.content
}


