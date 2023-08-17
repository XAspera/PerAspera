using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace PerAsperaEditor.GameProject
{
    [DataContract]
    class ProjectTemplate
    {
        [DataMember]
        public string ProjectType { get; set; }
        [DataMember]
        public string ProjectFile { get; set; }
        [DataMember]
        public List<string> Folders { get; set; }

        public byte[] Icon { get; set; }
        public string IconPath { get; set; }

        public byte[] Screenshot { get; set; }
        public string ScreenshotPath { get; set; }
        public string ProjectFilePath { get; set; }
    }
}
