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
    
    public partial class DimShipper
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DimShipper()
        {
            this.FactOrder = new HashSet<FactOrder>();
        }
    
        public int ShipperKey { get; set; }
        public int ShipperId { get; set; }
        public string Shippername { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<FactOrder> FactOrder { get; set; }
    }
}
