Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9339080A913
	for <lists+openbmc@lfdr.de>; Fri,  8 Dec 2023 17:34:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ump2ljFV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmxYS0Rmdz3d9H
	for <lists+openbmc@lfdr.de>; Sat,  9 Dec 2023 03:34:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ump2ljFV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com; envelope-from=olteanv@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmxXw4tctz3cTG
	for <openbmc@lists.ozlabs.org>; Sat,  9 Dec 2023 03:33:50 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-50c0478f970so2355293e87.3
        for <openbmc@lists.ozlabs.org>; Fri, 08 Dec 2023 08:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702053226; x=1702658026; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pxwrq+h8nplXaFB//isAgca+iL1KixWEf6Q6TqoQFaU=;
        b=Ump2ljFVH051FYAFkU4Ri0eP1QePVtFdwAgsUbB4N5UUi32ah7F0sbrecLAeA3K240
         jwF9aYS0tqwOx2COqjNcxVnbyXWL0DxBMKv5ptNXtwkhyFVrM+zwG2mvdIqT+JBaXJtz
         ef3XDMJFBDET8+X2w81IT9nhzsO9fP9iV8MYqirsc/LosA12HZ1qJAQ/StRQnNiC9OU0
         BrB7M40ZyYREV+QtnyrOiDjctjUw4O1/iFFuKhOB8VFbFoUVrKerUGewZXztdC+8g1C+
         oYrG2D3SY7s9kSDcgNh1NSpFc4PQ8BBwgi75e1KKW+e4M4VDOAcfzJBZ/lszFtBJKV9+
         9Kkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053226; x=1702658026;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxwrq+h8nplXaFB//isAgca+iL1KixWEf6Q6TqoQFaU=;
        b=O4zC8DqDYPFusuMwVHedgsG0gwGsg8nVis67VtZOvGekTWODqaSLrG+6rR+o7NAPIY
         yaDJYQQR/DZOHTT1D8W/xZQUS4dK+HP7leYJbkG2Xigg0ZWg/UcebTPrH7ny+MOQCwCa
         wJEsmdw8VrTmrZvI0s5zkx8g1f/Xq/NecJOhX+JiSNVOUTb7m//Y+ZJqO2H6JF8sYGOD
         AEm8gpOTws8jMOYv4TrySX4qt94qPubTmViVNXw6oNM5H7Ta9yhOWhO7s9PtoEuYAI0C
         nvwGXxZX1AUiCO4KDIIWla+dprY9plo6CU09M3jNKWg90Kd557xpTmPTJ/PgO3V3uGcu
         xRqA==
X-Gm-Message-State: AOJu0YxCIU5994TTa3yQxY9MEPFwTIexaAXSnj+ABhAKNikN5HRtZW22
	dgwbs5KQC4Kw0mvza5w+dSM=
X-Google-Smtp-Source: AGHT+IGgQKJL0HHO/Evrk7hLdKF/K41Ygp/TVwBLtCjh/+/dieukARYnSOLhKDT1T+59M4U8FY8Rbg==
X-Received: by 2002:a19:2d45:0:b0:50b:f411:9985 with SMTP id t5-20020a192d45000000b0050bf4119985mr87342lft.17.1702053225818;
        Fri, 08 Dec 2023 08:33:45 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id a15-20020a50c30f000000b0054bde4df7f0sm941078edb.66.2023.12.08.08.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 08:33:45 -0800 (PST)
Date: Fri, 8 Dec 2023 18:33:43 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH net-next 10/16] net: pcs: xpcs: Add generic DW XPCS
 MDIO-device support
Message-ID: <20231208163343.5s74bmirfna3o7yw@skbuf>
References: <20231205103559.9605-1-fancer.lancer@gmail.com>
 <20231205103559.9605-11-fancer.lancer@gmail.com>
 <20231205111351.xjjuwpbf7kwg3vuh@skbuf>
 <uivunnjv5vi3w3fkc5w2f4lem5bingrgajgjfsu2ih7fuhz6hd@3naeubr5spak>
 <20231205122316.ihhpklv222f5giz3@skbuf>
 <nflj4ajgx3byqhwna2eslldwulbbafmcwba4dwgxo65o5c7pmj@zbgqt2zje4ix>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <nflj4ajgx3byqhwna2eslldwulbbafmcwba4dwgxo65o5c7pmj@zbgqt2zje4ix>
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tomer Maimon <tmaimon77@gmail.com>, devicetree@vger.kernel.org, netdev@vger.kernel.org, openbmc@lists.ozlabs.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, Jose Abreu <joabreu@synopsys.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Fri, Dec 08, 2023 at 05:11:20PM +0300, Serge Semin wrote:
> My idea was to reuse the mdio_device which has already been created
> either by means of the MDIO-bus OF-subnode or by means of the MDIO-bus
> board_info infrastructure (can be utilized in the SJA1105 or Wangxun
> Tx GBE). The xpcs_create() method then either probes the device on the MDIO
> bus and gets ID from there, or just uses the custom IDs based on the
> OF compatible match table or on the platform_data. If no MDIO-device
> was created my patchset is supposed to preserve the previous
> semantics: create MDIO-device, probe the device on the MDIO-bus, get
> device IDs from there. See the next patch for more details:
> https://lore.kernel.org/netdev/20231205103559.9605-11-fancer.lancer@gmail.com/
> 
> > That was attempted a while ago by
> > Sean Anderson with the Lynx PCS. Are you aware of the fact that even in
> > the good case in which binding the driver actually works, the user can
> > then come along and unbind it from the PCS device, and phylink isn't
> > prepared to handle that, so it will crash the kernel upon the next
> > phylink_pcs call?
> 
> To be honest I didn't consider the driver bind/unbind option. But my
> case a bit different. DW XPCS MDIO-device is supposed to be created
> automatically by means of the DW XPCS MI driver from the DT-nodes
> hierarchy like this:
> mdio@1f05d000 {
> 	compatible = "snps,dw-xpcs-mi";
> 	reg = <0 0x1f05d000 0 0x1000>;
> 
> 	xgmac_pcs: ethernet-pcs@0 {
> 		compatible = "snps,dw-xpcs";
> 		reg = <0>;
> 	};
> };
> The platform-device is created for the mdio@1f05d000 node for which
> the DW XPCS MI driver is loaded, which calls the
> devm_of_mdiobus_register() in the probe() method which registers the
> MDIO-bus and then creates the MDIO-device from the ethernet-pcs@0
> node. The DW XPCS MDIO-device driver is attached to that MDIO-device
> then. In such model the PCS can be supplied to the DW *MAC via the
> "pcs-handle = &xgmac_pcs" property.
> 
> Regarding the current semantics it's preserved in the framework of the
> xpcs_create_byaddr() method (former xpcs_create_mdiodev()) by means of
> the next code snippet:
>         if (mdiobus_is_registered_device(bus, addr)) {
>                 mdiodev = bus->mdio_map[addr];
>                 mdio_device_get(mdiodev);
>         } else {
>                 mdiodev = mdio_device_create(bus, addr);
>                 if (IS_ERR(mdiodev))
>                         return ERR_CAST(mdiodev);
>         }
> Device can be automatically created if before registering the MDIO-bus
> the xpcs_create_byaddr() caller registered the MDIO-device board info
> by means of the mdiobus_register_board_info() method. In addition to
> that it's now possible to supply some custom data (custom device IDs
> in my implementation) to the XPCS driver by means of the
> mdio_board_info.platform_data field. See the next patch for
> reference:
> https://lore.kernel.org/netdev/20231205103559.9605-14-fancer.lancer@gmail.com
> 
> So what the difference with the Lynx PCS is that in my case the
> MDIO-device is created automatically as a result of the DW XPCS MI
> MDIO-bus registration. Additionally I implemented the MDIO-device
> creation based on the MDIO-board-info, thus there won't be need in the
> calling mdio_device_create() on each xpcs_create_mdiodev() invocation.
> The later part isn't that important in the framework of this
> conversation, but just so you be aware.

It's not really different, though. You can connect to the Lynx PCS both
ways, see dpaa2_pcs_create() which also searches for a pcs-handle before
calling lynx_pcs_create_fwnode(). What's subtly different is that we
don't (yet) have "fsl,lynx-pcs" compatible strings in the device tree.
So the MDIO controller will register the PCS devices as struct phy_device
(which still have an underlying struct mdio_device). The PCS layer
connects to the underlying struct mdio_device, and the phy_device on top
remains unconnected to any phylib/phylink MAC driver. That is confusing,
I should really get to adding those compatible strings to suppress the
phy_device creation.

> Regarding the driver bind/unbind. As I said I didn't actually consider
> that option. On the other hand my DW XPCS MDIO-device driver doesn't
> do actual probe() or remove(). The only implemented thing is the
> of_device_id table, which is used to assign PCS and PMA IDs if
> required based on the DT compatible property. So I can easily drop any
> MDIO device-driver part and parse the of_device_id table right in the
> xpcs_create_bynode(). From that perspective my implementation won't
> differ much from the Lynx PCS design. The only difference will be is
> the way the MDIO-bus is created and registered. In case of Lynx PCS
> the bus is created by the MAC-driver itself.

Nope, not true. Follow the pcs-handle in arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi.

> In my case DW XPCS MI is currently created in the framework of the
> separate platform driver. Do you think it would be better to follow
> the Lynx design pattern in order to get rid from the possibility of
> the DW XPCS MI driver being unbound behind the STMMAC+XPCS couple
> back?

I think you actually pointed out a flaw in the Lynx PCS design too.
Actually, it is a larger flaw in the kernel. You can also unbind the
MDIO bus which holds the phy_device, and phylib (and therefore also
phylink) won't expect that either, so it will crash.

> In this case the Dw MAC DT-node hierarchy would look like this:
> 
> xgmac: ethernet@1f054000 {
> 	compatible = "snps,dwxgmac";
> 	reg = <0 0x1f054000 0 0x4000>;
> 	reg-names = "stmmaceth";
> 	ranges;
> 
> 	...
> 
> 	pcs-handle = &xgmac_pcs;
> 
> 	// DW XPCS MI to access the DW XPCS attached to the device
> 	mdio@1f05d000 {
> 		compatible = "snps,dwmac-mi";
> 		reg = <0 0x1f05d000 0 0x1000>;
> 
> 		xgmac_pcs: ethernet-pcs@0 {
> 			compatible = "snps,dw-xpcs";
> 			reg = <0>;
> 		};
> 	};
> 
> 	// Normal MDIO-bus to access external PHYs (it's also called
> 	// as SMA - Station Management Agent - by Synopsys)
> 	mdio {
> 		compatible = "snps,dwmac-mdio";
> 		#address-cells = <1>;
> 		#size-cells = <0>;
> 	};
> };
> 
> I actually thought to use that hardware description pattern instead,
> but after some meditation around that I decided that having the DW
> XPCS device defined separately from the DW MAC node seemed better at
> least from the code separation point of view. Now I think that it
> wasn't the best decision. DW XPCS is always attached to the DW XGMAC
> controller. So it would be more correct having it defined as a
> sub-node. It would also helped to avoid the platform device driver
> bind/unbind problem.
> 
> What do you think? Should I re-design my patchset to be supporting the
> design above? (After having conversion with you I am more inclined to
> do that now than to stick with the currently implemented solution.)

I think that the placement of the "mdio" node as lateral vs subordinate
to the "ethernet" node would have fixed the issue by mistake. We should
be looking at it as a structural problem of the kernel instead. Don't
let it influence what you believe should be the correct design.

> > The pcs-rzn1-miic.c driver puts a device_link to the MAC to at least
> > tear down the whole thing when the PCS is unbound, which is saner than
> > crashing the kernel. I don't see the equivalent protection mechanism here?
> 
> You are right. I don't have any equivalent protection here. Thanks for
> suggesting a solution.

I think that a device link between the "ethernet" device and the "mdio"
device (controller, parent of the PHY or PCS), if the Ethernet is not a
parent of the MDIO controller, could also solve that. But it would also
require ACK from PHY maintainers, who may have grander plans to address
this snag.

> > Can't the xpcs continue to live without a bound driver? Having a
> > compatible string in the OF description is perfectly fine though,
> > and should absolutely not preclude that.
> 
> As I explained above Dw XPCS device can live without a bound driver
> because the DW XPCS MDIO-driver doesn't do much but merely gets to be
> bound based on the of_device_id table. In my case the problem is in
> the DW XPCS MI driver which indeed can be detached. Please see my
> long-read text above.

Yeah, common design, common problem.
