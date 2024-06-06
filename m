Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD38FE3E4
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 12:12:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HUQjbvCC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw0W41G7Yz3dJw
	for <lists+openbmc@lfdr.de>; Thu,  6 Jun 2024 20:12:16 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HUQjbvCC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com; envelope-from=fancer.lancer@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw0VW6pcBz3cXT
	for <openbmc@lists.ozlabs.org>; Thu,  6 Jun 2024 20:11:46 +1000 (AEST)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-52b82d57963so923581e87.2
        for <openbmc@lists.ozlabs.org>; Thu, 06 Jun 2024 03:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717668701; x=1718273501; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PrPn0o3FIz2PkjKVCMtEeALM6vIfsW/w5ARZz9TMBEw=;
        b=HUQjbvCCinTeq/qicfp9Yhp0HqH7eLvctXvC9XdRPHTvEv1+ZUEF2cScqpMFd4T9HE
         7SN5+//Ae427UF61rBx8b3UwdaWOEr2a+dM9q1ILXZzaPgwfbeNcIeFjwV/0JsmJjVnX
         /WwzHSFajmTnG8nT2TilKenUOUXGEVP6Ot1JTzvzPvxV6tbmOwuyPLUOoLD7mFnnS0d4
         UfOg88o9G/qA1IS2Zs8j20UJb7LnvGzQEYNsiNQLmtomY5JPaeImKpEJ6TAnwLm8m4AL
         mR3s6Yj/B12WbFdCpwK/jPjl4vuJgVer6pXOKaB142ftBUXsTNhfUh8q/rrS/DtOnkwj
         A3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717668701; x=1718273501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrPn0o3FIz2PkjKVCMtEeALM6vIfsW/w5ARZz9TMBEw=;
        b=F/bqrxkEYyWoCQ6cU4r8LXKZRxDgU0MMcLDI74B2KTRhAZuop2kTvm+73x8DuBiE8L
         cUKMNXy/aEh/mj3YCdVmCqfxz7l1l2FFOzKqFvHhB4qDet6o6EPAqV6tWiTuEUNrQKpH
         o7yTf5nuIpgx8PTWfJZTVfeWbH7qxLCZlAe5jGYqKWh1wAjS34MYes4VGTQORZmMYq+N
         Eybk3arXDZBWaq1umZitTe82GaaKATv+NOBt0WCCDJ7EZBe+hoADWQy6u7pmdWX15xBw
         1Yqdbr0tQfNmfBIPXc9Muw/WHq1GoyqyrrMXebZqNowDosoScPeY8I0zVwOwdpBccTpA
         fcHA==
X-Forwarded-Encrypted: i=1; AJvYcCV6f+HH0Lvrr9Ig59GsnlnpD2rU1wmnrlLabT/Yf5j6pTfzUMivSIw+Xa38yCJq5Mlp9NioysfWDPDu8xBoMJswaLdaWJugtV4=
X-Gm-Message-State: AOJu0YzGBDosXsigW2Ww0uFfj6UNJQOO2onzI1WN3iXKbpqGQbrNwUry
	YCTUlOqnCnO9X729jSUNjl2reR5vYAdihOVuVa/ViH/fXxn+TpYv
X-Google-Smtp-Source: AGHT+IEEoqSkrVdBo2sNxkzEhLKa+IkjxB5/wea+iqN3AAdUYp+ngznvDLJ0MMRnkvR2DhdNRmqauA==
X-Received: by 2002:a05:6512:31c9:b0:52b:b30e:a775 with SMTP id 2adb3069b0e04-52bb30ea865mr1328523e87.24.1717668700955;
        Thu, 06 Jun 2024 03:11:40 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb4216726sm148695e87.174.2024.06.06.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 03:11:40 -0700 (PDT)
Date: Thu, 6 Jun 2024 13:11:37 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: "Abhishek Chauhan (ABC)" <quic_abchauha@quicinc.com>
Subject: Re: [PATCH net-next v2 04/10] net: pcs: xpcs: Convert xpcs_compat to
 dw_xpcs_compat
Message-ID: <dwustofr63k6d76oayale5w6smjjjy43clu2hjphav2i5fro7q@gy65zuplacxx>
References: <20240602143636.5839-1-fancer.lancer@gmail.com>
 <20240602143636.5839-5-fancer.lancer@gmail.com>
 <4a6aa0ba-a5ff-4d28-8ad4-12d461e44381@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a6aa0ba-a5ff-4d28-8ad4-12d461e44381@quicinc.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Tomer Maimon <tmaimon77@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Cheluvegowda <quic_scheluve@quicinc.com>, Florian Fainelli <f.fainelli@gmail.com>, openbmc@lists.ozlabs.org, Russell King <linux@armlinux.org.uk>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Halaney <ahalaney@redhat.com>, Jose Abreu <Jose.Abreu@synopsys.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hi Abhishek

On Wed, Jun 05, 2024 at 12:15:54PM -0700, Abhishek Chauhan (ABC) wrote:
> 
> > @@ -482,7 +482,7 @@ static int xpcs_config_aneg_c73(struct dw_xpcs *xpcs,
> >  
> >  static int xpcs_aneg_done_c73(struct dw_xpcs *xpcs,
> >  			      struct phylink_link_state *state,
> > -			      const struct xpcs_compat *compat, u16 an_stat1)
> > +			      const struct dw_xpcs_compat *compat, u16 an_stat1)
> >  {
> >  	int ret;
> >  
> > @@ -607,7 +607,7 @@ static int xpcs_validate(struct phylink_pcs *pcs, unsigned long *supported,
> >  			 const struct phylink_link_state *state)
> >  {
> >  	__ETHTOOL_DECLARE_LINK_MODE_MASK(xpcs_supported) = { 0, };
> > -	const struct xpcs_compat *compat;
> > +	const struct dw_xpcs_compat *compat;
> >  	struct dw_xpcs *xpcs;
> >  	int i;
> >  
> > @@ -633,7 +633,7 @@ void xpcs_get_interfaces(struct dw_xpcs *xpcs, unsigned long *interfaces)
> >  	int i, j;
> >  
> >  	for (i = 0; i < DW_XPCS_INTERFACE_MAX; i++) {
> > -		const struct xpcs_compat *compat = &xpcs->desc->compat[i];
> > +		const struct dw_xpcs_compat *compat = &xpcs->desc->compat[i];
> >  
> >  		for (j = 0; j < compat->num_interfaces; j++)
> >  			__set_bit(compat->interface[j], interfaces);
> > @@ -850,7 +850,7 @@ static int xpcs_config_2500basex(struct dw_xpcs *xpcs)
> >  int xpcs_do_config(struct dw_xpcs *xpcs, phy_interface_t interface,
> >  		   const unsigned long *advertising, unsigned int neg_mode)
> >  {
> > -	const struct xpcs_compat *compat;
> > +	const struct dw_xpcs_compat *compat;
> >  	int ret;
> >  
> >  	compat = xpcs_find_compat(xpcs->desc, interface);
> > @@ -915,7 +915,7 @@ static int xpcs_config(struct phylink_pcs *pcs, unsigned int neg_mode,
> >  
> >  static int xpcs_get_state_c73(struct dw_xpcs *xpcs,
> >  			      struct phylink_link_state *state,
> > -			      const struct xpcs_compat *compat)
> > +			      const struct dw_xpcs_compat *compat)
> >  {
> >  	bool an_enabled;
> >  	int pcs_stat1;
> > @@ -1115,7 +1115,7 @@ static void xpcs_get_state(struct phylink_pcs *pcs,
> >  			   struct phylink_link_state *state)
> >  {
> >  	struct dw_xpcs *xpcs = phylink_pcs_to_xpcs(pcs);
> > -	const struct xpcs_compat *compat;
> > +	const struct dw_xpcs_compat *compat;
> >  	int ret;
> >  
> >  	compat = xpcs_find_compat(xpcs->desc, state->interface);
> > @@ -1269,7 +1269,7 @@ static u32 xpcs_get_id(struct dw_xpcs *xpcs)
> >  	return 0xffffffff;
> >  }
> >  
> > -static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> > +static const struct dw_xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> >  	[DW_XPCS_USXGMII] = {
> >  		.supported = xpcs_usxgmii_features,
> >  		.interface = xpcs_usxgmii_interfaces,
> > @@ -1314,7 +1314,7 @@ static const struct xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> >  	},
> >  };
> >  
> Serge, Thank you for raising these patches. Minor comments which shows warning on my workspace. 
> 

> WARNING: line length of 82 exceeds 80 columns
> #153: FILE: drivers/net/pcs/pcs-xpcs.c:1272:
> +static const struct dw_xpcs_compat synopsys_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> 
> WARNING: line length of 85 exceeds 80 columns
> #162: FILE: drivers/net/pcs/pcs-xpcs.c:1317:
> +static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> 
> WARNING: line length of 85 exceeds 80 columns
> #171: FILE: drivers/net/pcs/pcs-xpcs.c:1327:
> +static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> 

My checkpatch didn't warn about that even with the strict argument
specified.

Note there is just 3 and 6 characters over the preferable limit.
Splitting the lines will make the code less readable (in some extent).

So from that perspective it's ok to exceed 80 characters limit in this
case and not to break the generic kernel coding style convention.
Unless the networking subsystem has a more strict requirement in this
matter.

-Serge(y)

> > -static const struct xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> > +static const struct dw_xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> >  	[DW_XPCS_SGMII] = {
> >  		.supported = xpcs_sgmii_features,
> >  		.interface = xpcs_sgmii_interfaces,
> > @@ -1324,7 +1324,7 @@ static const struct xpcs_compat nxp_sja1105_xpcs_compat[DW_XPCS_INTERFACE_MAX] =
> >  	},
> >  };
> >  
> > -static const struct xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> > +static const struct dw_xpcs_compat nxp_sja1110_xpcs_compat[DW_XPCS_INTERFACE_MAX] = {
> >  	[DW_XPCS_SGMII] = {
> >  		.supported = xpcs_sgmii_features,
> >  		.interface = xpcs_sgmii_interfaces,
> > @@ -1418,7 +1418,7 @@ static int xpcs_init_id(struct dw_xpcs *xpcs)
> >  
> >  static int xpcs_init_iface(struct dw_xpcs *xpcs, phy_interface_t interface)
> >  {
> > -	const struct xpcs_compat *compat;
> > +	const struct dw_xpcs_compat *compat;
> >  
> >  	compat = xpcs_find_compat(xpcs->desc, interface);
> >  	if (!compat)
