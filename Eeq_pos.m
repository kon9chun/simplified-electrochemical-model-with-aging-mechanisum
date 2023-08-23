function E_pos=Eeq_pos(soc_surf_p)
E_pos=4.19829+0.0565661*tanh(-14.5546*soc_surf_p+8.60942)-0.0275479*(1./((0.998432-soc_surf_p).^0.492465)-1.90111)-...
    0.157123*exp(-0.04738*soc_surf_p.^8)+0.810239*exp(-40*(soc_surf_p-0.133875));
end