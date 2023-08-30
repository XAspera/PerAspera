using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerAsperaEditor.Utilities
{
    public static class IdUtil
    {
        public static int INVALID_ID = -1;
        public static bool IsValid(int id) => id != INVALID_ID;
    }
}
