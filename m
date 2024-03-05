Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D22872CB6
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 03:24:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=0pUeEFWV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqGTW5sTxz3bs2
	for <lists+openbmc@lfdr.de>; Wed,  6 Mar 2024 13:24:15 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=0pUeEFWV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=78716d20e=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TprFk3fYPz3cJW
	for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2024 20:42:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1709631754; x=1741167754;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=MriPafbb6XF6p2akRQbpbChXiYEuKJLI64NELCSXRB8=;
  b=0pUeEFWVOv0GyqNGES1ZKkv/1CA4YM+j64cm6nOrZO3DOt1x2yKu9BjK
   iI7JuPU5xpqpe9IThZTz4nOCDnPlpgULekatJ9vjSQ20GYzh2bNlzWu9u
   V1BFH+WGFZhrgYj75K1iSIn4HoFMf4d0i34BM7EKZRfbrI1gTiOLM/3J/
   g=;
X-IPAS-Result: =?us-ascii?q?A2FsAAB75+Zl/xYvFqxaHQEBAQEJARIBBQUBQAmBNAYBC?=
 =?us-ascii?q?wGCOHoCgV8DBSSEKZFnA5wxKoEsFIEsPg8BAQEBAQEBAQEHAQE7CQQBAQMBA?=
 =?us-ascii?q?4FJgnBGAhZVhwknNgcOAQIEAQEBAQMCAwEBAQEBAQgBAQEFAQEBAQEBBgQBA?=
 =?us-ascii?q?QECgRmFLz0NglwBEHcXYQQDBgYwAgEBAQEBAQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEHAg1COAEBAQECASMRRQUHBAIBBgINAQoCAiYCAgIvFRACB?=
 =?us-ascii?q?AENDYJ5gjwjFAaVPJs6eoEyGmeCFgSxWIEjBgkBgRAuAYFohj0BgVaEH4NBe?=
 =?us-ascii?q?4JPJm9CgWaBAj6CYQICGIERARIBIxUVgy85gi8EgRQjXIMSKYMwgSiNX4Quh?=
 =?us-ascii?q?W4JS38cA4EFBFoNBRYQHjcREBMNAwhuHQIxOgMFAwQyChIMCx8FVANDBkkLA?=
 =?us-ascii?q?wIaBQMDBIEuBQ0aAhAaBgwmAwMSSQIQFAM4AwMGAwoxMFVBDFADZB8WHAk8D?=
 =?us-ascii?q?wwaAhsUDSQjAiw+AwkKEAIWAx0WBDARCQsmAyoGNgISDAYGBl0gFgkEJQMIB?=
 =?us-ascii?q?ANUAyB0EQMEGgcLB3iCCYE9BBNGAQ0DgTQGih4Mgw8CBSMEJoFbA0QdQAMLb?=
 =?us-ascii?q?T01Bg4bBQQfAR18BaBXAYFZE4EpEBA2DBhYKw4HNRIJEQQMI5J/AR2Da65rD?=
 =?us-ascii?q?YMMgQOMCZIVgz4XhAWMeoZcA5JJl2QLbCCNUJpiAgQCBAUCDgiBQSoFgRpwM?=
 =?us-ascii?q?z2DOFEZkimPeXgCAQwsAgcBCgEBAwmGSIImBS9nXwEB?=
IronPort-PHdr: A9a23:izC3gBLv13iHogWhmtmcuHJgWUAX0o4c3iYr45Yqw4hDbr6kt8y7e
 hCFtLMw3RSRBs2bs6sC17CG9fi4GCQp2tWojjMrSN92a1c9k8IYnggtUoauKHbQC7rUVRE8B
 9lIT1R//nu2YgB/Ecf6YEDO8DXptWZBUhrwOhBoKevrB4Xck9q41/yo+53Ufg5EmCexbal9I
 RmoqQjdrMkbjI9tJqotxBbCv39Ed/hLyW9yKl+fgRXx6t2s8JJ/9ihbpu4s+dNHXajmcKs0S
 qBVAi4hP24p+sPgqAPNTRGI5nsSU2UWlgRHDg3Y5xzkXZn/rzX3uPNl1CaVIcP5Q7Y0WS+/7
 6hwUx/nlD0HNz8i/27JjMF7kb9Wrwigpxx7xI7UfZ2VOf9jda7TYd8WWWxMVdtKWidfHo2zc
 ZcAD+sZPeZZsYb9oUcOrQCjDgWoHe/j1yNEimPz0aA8zu8vExzJ3BY4EtwOrnrZssj7NLscX
 +62wqnHzynMYfxZ1jrm9IjHaQwtre2QUb5sc8fcz1QkGQPfjlWXrIzoJzab2foJs2if7+trS
 OChi3MhqwF+pjStwMEuiI/MiokIzV3K8Dt2wIIxJdy4UEF1Y8OkEJ1ftyyBLYR2Wd4iQ3pyt
 Ckmzb0GvIe2cS4Xw5so2xDRceaIc5SU4h39TuaRJy91iXxldb+8mxu/9Uytx/P9W8Sq31hHr
 zRIn9bSu30Q1hHf9NWLR/lz80mh1jiB2Bzf5O5FLE07m6fXNposz6I0m5cVrE/NECj2mEDsg
 6+XcEUp4vOn6+PgYrX6op+cNol0hhviPaQpn8yzGeQ5Mg8TX2iH5OSzz6Ps8VflT7VNi/07l
 LTSvpPCJckDu6K0ARFZ3pw95xqhFTur39YVkWMZIF5bYB6LkYnkN03ALf39EPuzn1ChnTZuy
 v3JIrHtHpDAImbAnbj8eLtw7lNQxQQ1wNtC+Z9UDqwBIOnvWkDvrtzWEx45Mg2qzOv/FNlw0
 J4VV3iVDa+DKqzStEeF5ucoI+aReoAYoC39K/055/72in85hEMdcbGp3ZQJbHC4GexrLVuDb
 3b1jdkOEHoGswsnQOPllVGOTyRfaGq1X6Im/jE7DpypDZvZSo+3m7yBwTy7EoVXZmBAFF+MD
 W/le5iGVvsSci6ePNFtniYLWLWjUYMtyw+iuBf/y7V9L+rU/iMYtYjk1Nhw/+DdkA899ThwD
 8Wdy26DTXx0nmUHRzItxq9/ulF9ykyZ3adkhPxYEMRf5/VSXQgiL57T0/R6C8zuWgLGZtqER
 k6qQs+6DjEpUtIx39gObl5+G9W4jxHD3DGnA7wLmLyRApw77Kbc02L2J8ZnxHbKzLMhgEU+Q
 stTKW2mgbZy9xDLB47InEWZl6GqdbkH3CHT72qDwm+Os1tZUA50S6nKQXcfZk7OodTj+kzCV
 6OuCaggMgZZzs6CMrVFatvyglVDWPjuI9DeY2Oqm2esHhaE3LSMbYvue2oHxyrdE1IIkwcJ/
 XaJZkACAXKCuXDPFy5yElynQET+9e5hs3C6Bhs31ROJR05szby4/lgSn/PKD7sw07YAqW8Bt
 jN7VAKlx9PZC92dvAdJc6BVYNd761BCgyaR/QtlM5qqKqtKgl8Fbx8xuFHq3h9sTIJanoJi+
 HQywQx4LKmw1FJaayje2oL0M7fMbG7o80b8RbTR3wT93dKS6+8v9fI3660bREDhQmkv93F25
 PlI1XS0747XF0wZVpenARV/zARzu7yPOnp13IjTz3A5dPDs6lcqk/olB+ognxCnedoXcKaJD
 xT7HMBSAc+yYPcrlF6kYlNhXqhS+ac4Mtnge66A36imb+pllSit2GJA5o0120mQ9i16H+jP2
 ZtNw/yR0gadETnmi1L0u9vqgsZPYjRBdlc=
IronPort-Data: A9a23:yT4CIKIGM4MszoNfFE+Rl5QlxSXFcZb7ZxGr2PjKsXjdYENS0GEGm
 mQeCGjTaf2MN2CnKd5wbIXioEIPvJ7VzdcwHAJorCE8RH9jl5HIVI+TRqvSF3rJd5WcFiqLz
 Cm8hv3odp1coqr0+0/F3oDJ9CU6j+fTLlbFILasEjhrQgN5QzsWhxtmmuoo6qZlmtHR7zml4
 LsenuWGULOb828sWo4rw//bwP9flKyakC8VuFU4ecdKsDf2/5XCJMlHTU0ZByKQrrh8RoZWd
 c6apF2K1jqxEyMWNz+Quu2Tnnvm4lLlFVPmZnJ+A8BOi/XZz8A4+v5T2PE0MS+7h9gV9jzYJ
 RokWZGYEG8U0qPwdOs1aiRVGn1RLKd9poDlG2m5l/XQkX2fSi65qxluJBle0Ywwxt4yLFEXq
 7kmcWpLZReZn+S73PSyUfR37ighBJC0ZsVF4Dc8kneDV57KQriaK0nOzfxV2DMhseBTG/n2b
 tEEcnxkaxGojxhnYA5IU8tlxb757pX5WyF3k0ypr+0m2FXe6gtAjanta+bZVcPfEK25mW7d/
 Aoq5V/RAQsIN/ScxCCD/3bqgfXA9QvjQIMdFLql7fNCj1iax2hVAxoTPXO8ufS/gEu1c9ZeM
 FAPvC08qaE47wqsVNaVYvGjiCfb5FhGAZwMTKtgsmlh15bp3upQPUBcJhYpVTDsnJNeqeACv
 rNRo+7UOA==
IronPort-HdrOrdr: A9a23:5uWM9a44iZYyLB38HwPXwYSCI+orL9Y04lQ7vn2ZFiY7TiXIra
 yTdaoguCMc0AxhIk3Jmbi7Scu9qADnhONICO4qTP2ftWjdySCVxe5ZnO3fKlHbexEWs9Qtrp
 uIEJIOReEYb2IK9PoSiTPQe71Lrri6GeKT9J/jJh9WPEZXgspbnmJE43OgYypLrX59dP4E/f
 Snl6l6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKXySw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8xfT9aw+cxDpAVr4RG4FqjwpF491HL2xa0u
 Ukli1QfvibLUmhO11d7yGdnzUImwxel0MKgWXo/kcL5/aJAg7TwaJ69Ntkmtiw0Tt5gDkHup
 g7hV5w7PBsfE79dGCX3amXa/mu/nDE+kbLVYYo/iBiuUx3Us4PkWVXxjIqLL4QWC3984wpC+
 9oEYXV4+tXa0qTazTDsnBo28HEZAVEIv6qeDl3hiWu6UkgoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBZLfMB2EfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPJgF1oE7lp
 jNWE5R8WQyZ0XtA8uT24AjyGGFfEytGTD2js1O7ZlwvbPxALLtLC2YUVgr19Ctpv0Oa/erLs
 pb+KgmccMLAVGearqhhTeOKqW6AUNuIPEohg==
X-Talos-CUID: 9a23:hXUDJm/bVzBZ1AP3tACVv3cpF8l5XWzX9ynvAXWpD0BQC+OlEGbFrQ==
X-Talos-MUID: 9a23:H2OLIwkmHBFkbRgRLeNMdnp+G/x2367pGXswnLMBipSVNXdMNxiC2WE=
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-EX16-V12.corpnet.asus) ([172.22.47.22])
  by ms.asus.com with ESMTP; 05 Mar 2024 17:42:29 +0800
Received: from APZA002EXB.corpnet.asus (172.22.6.14) by
 TP-EX16-V12.corpnet.asus (172.22.47.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 5 Mar 2024 17:42:29 +0800
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (104.47.110.40)
 by APZA002EXB.corpnet.asus (172.22.6.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Tue, 5 Mar 2024 17:42:29 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ocfSnRm7RzC8SVksxZUL5IqZ09zBHPTdJgDKdyrFLLPWz3zla+MGlNNUf+PdMQktmzipcveZXh17+9uDFfaoL2R/95sEnsqXtE2GuCuaRfsUESB6R/fjB01yyVi44lQqchpzPendhSqhgzMxxKTi3BtByhvOm5IuZDlAEJuW3yyJ6sZRguCSMM5xhgsofxea7HZ7t+ZIFBJYWA9YK/Nk1UCCdJMjDxcDENODDz4Q3UwcpR/rIaXWpKTidWmgk+MtK7duic3okvnDiBv3wxeKROS6xjeCg7vCoXfjSmdiol2mJOKyMy9hylSrRQTYmhzMNmV5gX6Sr2nLdbNEVXvEeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyia1uIesbyQ87khcw8Y4TAKDar6exHulCU8/wYNKlM=;
 b=LJENokzpq90qgGtk81FUtSWO154VqXZIOHOQNSydpbKqEv8ehR0lBrGO1RZ3k8ZZLbxyzRTlloPUphkNETDNIUMdga9PsFBF1fbQu8BSZ4jvCad9/Q+8q7U3R7BIbFkLMBA107+gPLiyS0J3B1vHn+4fSZufIsg6oqkgxEf3wRK1xaTtT2/Oi7EEBPsWS5s/3IsMzTH8XO7obBF0YbovXS2afQYgevTsKG2Ij2ExP29oqIL5qd4qnQ1SAGClCCEIiCC258SnAU09+/OirUKixmy/4ekTMsiWnc1WvkgfwJOWpwAu0kr5iV2CTjACaluIyQBKy5QJMbuoJ0QnwA2xmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com (2603:1096:400:28d::13)
 by KL1PR04MB7660.apcprd04.prod.outlook.com (2603:1096:820:124::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.41; Tue, 5 Mar
 2024 09:42:27 +0000
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6]) by TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6%3]) with mapi id 15.20.7339.035; Tue, 5 Mar 2024
 09:42:27 +0000
From: =?utf-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Kelly Hung <ppighouse@gmail.com>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: RE: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Thread-Topic: [PATCH] ARM: dts: aspeed: asus: Add ASUS X4TF BMC
Thread-Index: AQHaU1tmXKt4Bs16f0enSF1ARi3vRbD1OiSAgDOLYuCAACvXAIAAJ58A
Date: Tue, 5 Mar 2024 09:42:26 +0000
Message-ID: <TYZPR04MB6596ACF05A2D79377F53A0F09D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
References: <20240130090447.198103-1-Kelly_Hung@asus.com>
 <acd6f49b-b476-4364-8263-06e20a0c599d@kernel.org>
 <TYZPR04MB6596BB61B2D1B9216F06A18E9D222@TYZPR04MB6596.apcprd04.prod.outlook.com>
 <c88558f8-acc1-4b36-b729-bdf1019e81a0@kernel.org>
In-Reply-To: <c88558f8-acc1-4b36-b729-bdf1019e81a0@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6596:EE_|KL1PR04MB7660:EE_
x-ms-office365-filtering-correlation-id: 3ed79ee3-6c4d-401a-81cd-08dc3cf89171
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qAxggEzfPK1XISCo1vbENj9skbvRSgXStshJDZ+Xz3Nx0dg0tAHaEO5uwuabRs/LAAL46PgsblNc/1dPklLkMLungTmC4zuDRs3R4U5QuaUFcgTh3+PhzeLXpZUK/qCFOMVDzpfn6+ZiUcWgTMJ4HQO8evMPHUX1GDYMwpR5cq5NZ1BIEyVHyGxsKAqMLGEKtfLgkmXbhdQkKdCV7fwZWdgDtCrR1IfsvtqFp8sgkpFYH7e9Tu70lhdkSXzhjOlhVM4htcRb78tUT+ZSoC6k2/rnBbWxR55obGVoQrhdgQXz25CPJCUVydPvpzXAJz5QqM18+P0XSaqYyA2dcWsxxtbRUtBtDj5W+QkDCFw9Xa9UHh/xD4rsFUvCMGKQBwp3MbaQMCLLXfe6X53iMDZNbsLbDHOp9L/gqeVm2OmEjapcrcd/ARDTJkGVihTezKeA5XcbDwPsjwm2UGnugXJk4aAInAKCqCi18+dqXaHPbqRQu4RDfH7YWc9oaEY0kRX0QhILHtOqkIsj9q+hAnZ4GluF8/CB7ZwtHudcLWu8kfZ6h28jzJ+jjOX9INzAznUJvA0qzX0OOqP8r4uy6jfH2sX/zG/RZIXaAnOkvRwo5EJ8OYF0UzdSg7MJo84x8AIn4l8mb/hULOR8DOELG3qc4XiEjKMawojJG6auZqZsGx0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB6596.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFlqZXA3UTRJZFBJS3JBV09MQ045cFVhbFdna3ZvcWRNNDQrS3hjSTM2THph?=
 =?utf-8?B?dnkwZGJPSGNickErbkRJZFAwY1d1U05Fa2RLY0taL0p0eGhjUEJpZTBJTXRK?=
 =?utf-8?B?VWhTTG8ra1FWQ0lwODk1UmxyQlRHWXpRWXFLa0ZrbjlMZ1JEeEJqdCtmdk02?=
 =?utf-8?B?dGgzK0hCL2tIMy8rSnJ3a0poaEZkRUdGdklCVGFFK3BJUTBGVmhyY0JIN2Nj?=
 =?utf-8?B?Mjh1cXVsYVVVYktGYlRGRjhIcDlJcWlJVnBVVWNwTW13eE1pRzNWSWFrdmNy?=
 =?utf-8?B?ZEVzWG5PK1FHdFRRQ2J0cXJ6dVozNE9FWkNnSW5QNDVaeFRjZnc5NVZTZkZp?=
 =?utf-8?B?QStUS3kxb2dkWVR5WEtZOEIyTlpPdlVrb29SVG52dk1GZkV1K1cxOXc3MTRV?=
 =?utf-8?B?Uk4yWHFDQTRtem15U1h3T1F0cTN4STI0dy9TUXF4dGcwY2E5ZlpldnA3NkVL?=
 =?utf-8?B?cklUVHBLZVhVY085SkJvNzYvTSt5cWdQcWhOeGgwVmhiSXJ4eWNvNlRTRHJj?=
 =?utf-8?B?WGJEZ0xIem1mY2V0bzR5RU1EMlBPTm9zTklFVmdQZzhaSFlvZkZ4V3Vxd1RB?=
 =?utf-8?B?MW1TT0NkbWFtNTRUOXNmTDVRWTI0ekhjWEdpMVpid1ZTWTZBRm1MdnNCbnRn?=
 =?utf-8?B?ZU9DMVBENi9rc3RhS2ZKTzlDZ2hwRDNJZGtsRmZTdkdNN3BSRGg2R296MC9r?=
 =?utf-8?B?N2d3WnlJUExYV000QUUzbm5wMit3SnBSMmVyWVdRWHUwSi91alhRZ0V1MThF?=
 =?utf-8?B?dWVOWHN4NnlXN3JrT0dEUGJiSzM1MFFGY0NuWUdwaFg5YjRzZ1Z0VE1SdzVu?=
 =?utf-8?B?cGpCaTE0Tlk5RzdYUXpXbHNicm1WRUQ0OVhDd1NQSUNtQ0VySDc5cWtNdlhi?=
 =?utf-8?B?RkFEU09Ja1loRnh6L3JGTDZuNjc2ZldhdWNZMzZQT05MUXJjbW84bDFQeVEz?=
 =?utf-8?B?VkFhMCs5RTg3aElLZlpIUVB1YXJmMmphUDhvV1lkcDN5R2o3UHMyTkZjYkIv?=
 =?utf-8?B?YzBxWGk1eG44STJ4a2QxeVluRDl1TzRPQ1BLbHhNUU9UNUNwWkxpQVI2NHp5?=
 =?utf-8?B?ZjdBaUEvRk1ESjZtZUpiRjluVXduWmlhc29xQVgwK1FXWUtOdTZseGtrYnoy?=
 =?utf-8?B?OVlyNTZ4cUxHckNkRTBEaXhVYWFmSlJoMGVRR3U4eGpqbXN4MVlQa2gxcTBP?=
 =?utf-8?B?a3liNnJ5cVZoV3B6WDZjSWlQZmZTUkNWZGpKc2VIY0p6TUpveHBlY21US2xj?=
 =?utf-8?B?ZlpCYVpLWG83NmVmemFheFpkWXlPVVhZV0s5Qk9mQ2JPZkZ2YmdVdDl1TTRs?=
 =?utf-8?B?d3JqYnZPV0h2S3RJaG1iaVhUanBJOC9zU21UcHJYMVRKb09TbFpwblBvVytz?=
 =?utf-8?B?U3lxV3lZL1hPNzZTNldxSmY3WjR2Z2JvYzk4eXlONkdOWDUxQWZ4UGlzM3px?=
 =?utf-8?B?aHk3N2xsTUdRWTJKeFl1R2prYW1GdGFKb1VoaWM3cXZyRHpSMjhpTk93eWZr?=
 =?utf-8?B?OTNaYlhoSVh3SkhiTjJ0YVh2YW15UmpjTVlHZ0lQdjQwYlVjc1lhQ0tDRTdm?=
 =?utf-8?B?UUIvVHVVWVk1Z3hKekFYci9kbnJFVjh4VGxRVy9LemJBaDhWem5CZjhac3Bw?=
 =?utf-8?B?R01GNzdoM0pDa2NTaitsR2d3dVVyWUt1V0oxaCtqajNoS1cvTTRmNDRYckRD?=
 =?utf-8?B?YmZ2VysrWnpFMndGOTQ5Y3ZkMjJMVlNxancxWFI4WExRMFYxZlVrcEhPVzFi?=
 =?utf-8?B?dWZqVmIvc0NYbDdGYXhuZjRNZ2x6R2Zua2pOQndBTldWNkpRVFJCQ2ZVUm1y?=
 =?utf-8?B?dnprU0Y4WjI5TXFWWWkydU14eHdJYWVDeWNISlVTSkJETDVSbzBScHg3Mzlw?=
 =?utf-8?B?a096RkFDc1VlZnJsdUFraTBwcFFIYlJRNTZJdnRtZk1UTHhIbnRjekRiK0dn?=
 =?utf-8?B?Nzl0aWU0TXF1WVpHellGbWJJbjB4MDliZkhEclZXbHVva1BkVjV0WU5QdXVO?=
 =?utf-8?B?TjdJOFlZS2JDYzlVUVZrVUVhK1drQm5zekd0b0ltSmUyWktVSk1kZ1RmUlNJ?=
 =?utf-8?B?Ykc5WUJaMVFQQUxEOVViMFhoSklITXg1VlA4a2RGcWpTcHJKa1ZKYUJNNm9n?=
 =?utf-8?Q?GV1bnx6bYo44oP3gweRahz7bB?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6596.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed79ee3-6c4d-401a-81cd-08dc3cf89171
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2024 09:42:26.9104
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oPwkoouGnP5EtcIWEGnFCVgW4CuxWwCf3gWDheUSbjEM4iaYl3QT7E1ouQcu46P+R2kO9hiV9RLHG0teWkdBbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB7660
X-OriginatorOrg: ASUS.com
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28232.004
X-TM-AS-Result: No-10--25.386100-8.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/35ETspAEX/nhElzmV6ujCEbU+XbFYs1xISKyCnLh/UYB3E
	y8bUOyJjoQ+j/yh+pGOmQ1GZvrs8FSQ1bICC85lCbImvEGrHk0LR0xsa/Zm6LaFRWC8HCKx26iG
	pUBCWjnQ5aea+zMj48wY++FxurR7Haps/EoPWap+t08hy9o8h9gpVUcizZgC+reGXMMoufLk63r
	qopd/az3zGJvYd0NWQz+KkPKvGL7S+Gd/Z3/DKgl154oVx0Y26iGxYTIJ53kfgRdlteDzeLgLuA
	CtmyFaj2yihqMEbWTBW0C6Rw5WiDJnzZAu7Xu9tJPlTeUnhPwrO7rNMFe/H5Vo7GmCOJYd1O50T
	9A74HCvgKP76fIb9PJRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--25.386100-8.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28232.004
X-TM-SNTS-SMTP: 	4AC4E3EEF9ABB8141F4D81D122E0C6AC3616E1423F5C1A81A008661316DDA71A2000:9
X-Mailman-Approved-At: Wed, 06 Mar 2024 13:23:00 +1100
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
Cc: =?utf-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, =?utf-8?B?VGFpamllIFd1KOWQs+azsOmgoSk=?= <Taijie_Wu@asus.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCg0KPiA+T24gMDUvMDMvMjAyNCAwNzozMCwgS2Vs
bHkgSHVuZyjmtKrlmInojokpIHdyb3RlOg0KPiA+DQo+IFBsZWFzZSByZXNwb25kIGlubGluZSwg
aW5zdGVhZCBvZiB0b3AtcG9zdGluZywgYmVjYXVzZSBpdCBtYWtlcyB5b3VyIGVtYWlscyBoYXJk
IHRvIGZvbGxvdy4NCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuOC1yYzcv
c291cmNlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0wzNDAN
Cj4NCg0KVGhhbmtzIGZvciByZW1pbmRpbmcgbWUgbWFueSB0aW1lcywgSSB1bmRlcnN0YW5kIG5v
dy4NCg0KPiBZb3Ugc3RpbGwgaWdub3JlZCBteSB0YWcuDQo+DQo+DQo+ID4gPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PQ0KPiA+ID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCj4gPiBUaGlzIGVtYWlsIGFuZCBhbnkgYXR0YWNobWVudHMgdG8gaXQgY29u
dGFpbiBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24NCj4gPiBhbmQgYXJlIGludGVuZGVkIHNvbGVs
eSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIGl0IGlzDQo+ID4gYWRkcmVz
c2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUNCg0KPiBNYXliZSBJIGFtIHRoZSBpbnRlbmRlZCByZWNp
cGllbnQgb2YgeW91ciBtZXNzYWdlLCBtYXliZSBub3QuIEkgZG9uJ3Qgd2FudCB0byBoYXZlIGFu
eSBsZWdhbCBxdWVzdGlvbnMgcmVnYXJkaW5nIHVwc3RyZWFtLCBwdWJsaWMgY29sbGFib3JhdGlv
biwgdGh1cyBJIHdpbGwganVzdCByZW1vdmUgeW91ciBtZXNzYWdlcy4NCj4NCj4gUGxlYXNlIHRh
bGsgd2l0aCB5b3VyIElUIHRoYXQgc3VjaCBkaXNjbGFpbWVycyBpbiBvcGVuLXNvdXJjZSBhcmUg
bm90IGRlc2lyZWQgKGFuZCBtYXliZSBldmVuIGhhcm1mdWwpLg0KPg0KPiBJZiB5b3UgZG8gbm90
IHVuZGVyc3RhbmQgd2h5LCBwbGVhc2UgYWxzbyBzZWU6DQo+IGh0dHBzOi8vd3d3LnlvdXR1YmUu
Y29tL2xpdmUvZk1lSDd3cU93WEE/c2k9R1k3aWdmYmRhNnZualhsSiZ0PTgzNQ0KPg0KSGksIEty
enlzenRvZiwNCkkgaGF2ZSBhbHJlYWR5IGFza2VkIG91ciBjb21wYW55J3MgSVQsIGFuZCBiZWNh
dXNlIG9mIHNlY3VyaXR5IGxhd3MsIElUIGNhbm5vdCBoZWxwIG1lIGRlbGV0ZSB0aGF0IGNvbmZp
ZGVudGlhbCBpbmZvcm1hdGlvbi4NCg0KQmVzdCBSZWdhcmRzDQpLZWxseQ0KPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT0NClRoaXMgZW1haWwgYW5kIGFueSBhdHRhY2htZW50cyB0byBpdCBjb250YWluIGNvbmZp
ZGVudGlhbCBpbmZvcm1hdGlvbiBhbmQgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBv
ZiB0aGUgaW5kaXZpZHVhbCB0byB3aG9tIGl0IGlzIGFkZHJlc3NlZC4gSWYgeW91IGFyZSBub3Qg
dGhlIGludGVuZGVkIHJlY2lwaWVudCBvciByZWNlaXZlIGl0IGFjY2lkZW50YWxseSwgcGxlYXNl
IGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUgc2VuZGVyIGJ5IGUtbWFpbCBhbmQgZGVsZXRlIHRoZSBt
ZXNzYWdlIGFuZCBhbnkgYXR0YWNobWVudHMgZnJvbSB5b3VyIGNvbXB1dGVyIHN5c3RlbSwgYW5k
IGRlc3Ryb3kgYWxsIGhhcmQgY29waWVzLiBQbGVhc2UgYmUgYWR2aXNlZCB0aGF0IGFueSB1bmF1
dGhvcml6ZWQgZGlzY2xvc3VyZSwgY29weWluZywgZGlzdHJpYnV0aW9uIG9yIGFueSBhY3Rpb24g
dGFrZW4gb3Igb21pdHRlZCBpbiByZWxpYW5jZSBvbiB0aGlzLCBpcyBpbGxlZ2FsIGFuZCBwcm9o
aWJpdGVkLiBBbnkgdmlld3Mgb3Igb3BpbmlvbnMgZXhwcmVzc2VkIGFyZSBzb2xlbHkgdGhvc2Ug
b2YgdGhlIGF1dGhvciBhbmQgZG8gbm90IHJlcHJlc2VudCB0aG9zZSBvZiBBU1VTVGVLLg0KDQpG
b3IgcHJpY2luZyBpbmZvcm1hdGlvbiwgQVNVUyBpcyBvbmx5IGVudGl0bGVkIHRvIHNldCBhIHJl
Y29tbWVuZGF0aW9uIHJlc2FsZSBwcmljZS4gQWxsIGN1c3RvbWVycyBhcmUgZnJlZSB0byBzZXQg
dGhlaXIgb3duIHByaWNlIGFzIHRoZXkgd2lzaC4NCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09DQo=
