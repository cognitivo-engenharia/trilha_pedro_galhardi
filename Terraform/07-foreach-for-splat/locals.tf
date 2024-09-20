locals {

  files = ["ips.json", "report.csv", "sitemap.xml"]

  file_extensions = [for file in local.files : regex("\\.[a-zA-Z0-9]+$", file)]

  file_extensions_upper = [for f in local.file_extensions : upper(f) if f != ".json"]



  ips = [
    {
      public: "23.23.123.25",
      private: "192.168.0.1"
    },
    {
      public: "10.0.0.1",
      private: "172.16.0.1"
    }
  ]

}



