//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Northwind.ConceptualModel.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class DimEmployee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DimEmployee()
        {
            this.FactOrder = new HashSet<FactOrder>();
        }
    
        public int EmployeeKey { get; set; }
        public int EmployeeId { get; set; }
        public string Employeename { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FactOrder> FactOrder { get; set; }
    }
}
