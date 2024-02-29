Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB4E86D694
	for <lists+openbmc@lfdr.de>; Thu, 29 Feb 2024 23:08:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=aOz7FydO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tm5332CJ4z3vX6
	for <lists+openbmc@lfdr.de>; Fri,  1 Mar 2024 09:08:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=asus.com header.i=@asus.com header.a=rsa-sha256 header.s=asuscom header.b=aOz7FydO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=asus.com (client-ip=103.10.4.13; helo=ms.asus.com; envelope-from=prvs=782c5d7c4=kelly_hung@asus.com; receiver=lists.ozlabs.org)
Received: from ms.asus.com (ms.asus.com [103.10.4.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlpct0zgcz3bcP;
	Thu, 29 Feb 2024 22:18:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=asus.com; i=@asus.com; q=dns/txt; s=asuscom;
  t=1709205518; x=1740741518;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=G7xjFO6rnfIpnqOEMygz0A8UVELR9wuTpkFnveilAtE=;
  b=aOz7FydOzVsNJra8ovwXQroM9gHRZKYDfE/RrDtngu2ZCjbf/oqZOpo2
   D0aQk04MWIysTM2cvqPOixR3Wgjh9J1UMYv/l9rMZKv+V+HiDjqlqOKmM
   1GZ0jGeq6fBz/wpe6sUlTF05TDSSe3jBam/DQbsIw7tVyOB63y+t+3ZbI
   U=;
X-IPAS-Result: =?us-ascii?q?A2EtAABNZ+Bl/xIvFqxaHQEBAQEJARIBBQUBQAmBMggBC?=
 =?us-ascii?q?wGCOHoCgV8DJ4QpiB2JSgOKIYE/kFEqgSwUgV8LDwEBAQEBAQEBAQcBAS4NC?=
 =?us-ascii?q?QQBAQMBA4FJgnBGAhZVhwcnNAkOAQIEAQEBAQMCAwEBAQEBAQgBAQEFAQEBA?=
 =?us-ascii?q?QEBBgQBAQECgRmFLz0NglwBgQcXdDArAg16AQEBAQMBIgQNRQwEAgEGAg0EB?=
 =?us-ascii?q?AEBAQICJgICAh4HChUICAIEAQ0FCIJ5gisDMRQGkz6bOnp/MxpnghYEsB8Ng?=
 =?us-ascii?q?SyBIwYJAYEQLgGBaIYfHgGBVoFsgjODQXuCTyZvQoFmgQI+gh9CBIEpARIBC?=
 =?us-ascii?q?RoFEBUMAoMhOYIvBIEUI1yDEimDMIEohR6HL4ESgxo7JoVkCUuBAhwDgQUEW?=
 =?us-ascii?q?g0FFhAeNxEQEw0DCG4dAjE6AwUDBDIKEgwLHwVUA0AGSQsDAhoFAwMEgTAFD?=
 =?us-ascii?q?RoCEBoGDCYDAxJJAhAUAzgDAwYDCjEwVUEMUANkHxYcCTwPDBoCGxQNJCMCL?=
 =?us-ascii?q?D4DCQoQAhYDHRYEMBEJCyYDKgY2AhIMBgYGXSAWCQQlAwgEA1QDIHQRAwQaB?=
 =?us-ascii?q?wsHeIIJgT0EE0YBDQOBNAaKHgyDEAIFJQQsXQNEHUADC209NQYOGwUEHwEdf?=
 =?us-ascii?q?AWgAAGBWRNoQRAQAxEiDBhGEisVNRsRBCqQRYJAgz9JrXpwDYMMgQOMCI0pg?=
 =?us-ascii?q?XuGKxeEBYx6hlwDGJIxmFoggjOLHYQAlmACBAIEBQIOCIFBI4EmcDM9gzdSG?=
 =?us-ascii?q?Y47FoNYj3l4AgEMLAIHAQoBAQMJhkiCJgUvZ18BAQ?=
IronPort-PHdr: A9a23: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
IronPort-Data: A9a23:C0pVqqsyIPdelF9+J7SREN+vNufnVBteMUV32f8akzHdYApBsoF/q
 tZmKWzSPKncNjP1ed90bN+z/BgCv5TQzNBmQQE9+Hs1FypG9ZOVVN+UB3mrMnLJJKUvbmo+t
 JxGNYOowOPY7JP4jk3wWlQ0hSQkvU2wbuOgTrSCYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj7yyHlEAbNNwNcawr41YrS8HuDg9yv4Fv0jnRmDdhXsVnXkWUiDZ53Dcld+FOjGuG4tsbjL
 wry5OnRElHxpn/BOfv8+lrPSXDmd5aJVeS4Ztq6bID56vRKjnRaPq/Wr5PwY28P49mCt4gZJ
 NmgKfVc4OrmV0HBsL11bvVWL81xFah92bqAECS6i9Cw9VyfQUXGnPp0PmhjaOX0+s4vaY1P3
 cAgbRUhKy7b3aS9x6ijTORwwM04MdKD0IE34y46i2uDS6p5B8mTK0nJzYYwMDMYpc1KGefpR
 9cfZhJmdwnbJRZIPz/7Dbpkxbb13SOgKmwwRFS9urg7w1XM0RxLy6H3bsDZfu7SFc5sgRPNz
 o7B1yGjav0AD/Sc0yiU6WCwgeGJniTpXIUND7653vprhlSJwSoUEhJ+fUOjoPa5jVOlVvpQL
 kUV/mwlqq1a3FasRNm+UwGQo3OeuBMYHd1KHIUS6xuf27HG/wGXQGsDXDpGd8cltYw6WRQu1
 1mAhdSvAiZg2JWeTnSa7PSYsRuxNDITIGtEYjULJSMH5NTniIM2lVTOQpBqDcadh9v5Azzv6
 zuNoCU1gLMIkdQW3Ln99lfCxTuxzrDFQxA07QjLRG+oxh12aZTjZIGy71Xfq/FaI+6xSliHo
 WhBktKbqeMDF5eAkASJQf4RB/eo4fifOTHRiFIpGIMunxyp+ni+bcVZ+ylzKUtBNscfZSSvZ
 13XsAlKophJMxOCaa5xfpL0CMkwy6XkPcrqW+qSbddUZJV1Mgid80lGYlad2Wrom2AokLojI
 tGcY8KlB21cDr5opAdaXM9EjuVtnHp4mTyVHMCTIwmb7IdyrUW9Ed8tWGZipMhjhE9YiG05K
 +piCvY=
IronPort-HdrOrdr: A9a23:S+NSHqhJcDVN4AwaxIMA9C2JuHBQX5Z23DAbv31ZSRFFG/FwyP
 rAoB1L73PJYWgqNU3IwerwQpVpQRvnhPxICPoqTMqftW7dySGVxeBZnMDfKlLbakvDH4JmtZ
 uINpIOc+EYbmIKwPoSgjPIaurIqePvmMvD64bjJjVWPHlXgslbnkBE422gYyhLrXx9dP0E/e
 2nl656TlSbCBcqR/X+IkNAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uHw9n8PMHyy
 zoggb57qKsv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+cxTpAJb4RFYFqjgpF4N1H22xa0+
 UkZC1Qffib3kmhP11dZyGdnjUIngxer0MKgmXo/UcL6faJOw7STfAxw76wuHPimhMdVBIV6t
 MS44ri3aAnVy8px07GloX1v1UArDvrnZLm+dRj1EC2leMlGeNsRUt2xjILLH5IJlOF1Kk3VO
 ZpF83S//BQbBeTaG3YpHBmxJi2Um00BQrueDl1hiW56UkjoJlC9Tpu+OUP2nMbsJ4tQZhN4O
 rJdqxuibFVV8cTKaZwHv0IT8e7AnHEBUukChPbHX33UKUcf37doZ/+57s4oOmsZZwT1ZM33J
 DMSklRu2I+c1/nTceOwJpI+BbQR3jVZ0Wl9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRtbWXv
 6iUagmdsML7VGea7qh8zeOKKW6c0NuIfH9kuxLK26zng==
X-Talos-CUID: 9a23:tCJFDmO8lt0mke5DXRJG8QklRsUfbl7n3S7iHWXnBnxbYejA
X-Talos-MUID: 9a23:wevtAwXG8ogyWbHq/CD+iBFfK9p42b+3Eh4XnZE045mPDDMlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from unknown (HELO TP-MD-V02.corpnet.asus) ([172.22.47.18])
  by ms.asus.com with ESMTP; 29 Feb 2024 19:18:34 +0800
Received: from APZA002EXB.corpnet.asus (172.22.6.14) by TP-MD-V02.corpnet.asus
 (172.22.47.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Thu, 29 Feb
 2024 19:18:32 +0800
Received: from APC01-SG2-obe.outbound.protection.outlook.com (104.47.26.104)
 by APZA002EXB.corpnet.asus (172.22.6.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28 via Frontend Transport; Thu, 29 Feb 2024 19:18:31 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f4VVQHcGZpIJy2xWaA/6qhX67dSf4jYTQQxvRiwwXGZO9/gR/uK1S81PkShnYEowXOs9mm11eCuCn0kRmuOtFR3I3RFTkevqt0oZ9+EfgA5FnKKlF8mCZNu5ULPzq9ayPCl2h22zesP6Gqm/SUeCfKwYSwjrM+yOuiU3hpPTSISamuQ/S73SWwPn799CD7XMejnmMFMDQy/S2tbMAKrj/QGeGlOXqXqIwsqq6FuIKClJ7kgxcfJJEYcQBe4dWWdJLoa/YnkUyqHAB4iXZHINx8QSd1pvZiiv2a2DzbmzacaAYZeCPfrNJnoev4krKYmUJT5+B3Kie6UDNzklYvOL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPC0Fs1IAfamP8pKFY8Cklce1BfQGg3oV8zZHVogank=;
 b=mZBYBch4Y8FHWoF/BT+yUud+4K4hXRB4EG3xZrJO+GMO9EA/PGoTqK2GxCT2mAyTKAcu7WITCzBKLEllmTf1IIZp4lwx7Ep/Z9uDaKBmwbst7iohdgef9aVqYfpPvsJ8g75fG+vfrIqKmzBeCo6Zx+yBNw4fP4W8Dj57GDcrHlPfAxYNbEn6dTsXh6+KS7LREzPWcSQu3xFN6tL1kV26HitnWJhKB9wwCh5keFzBrv1ezxesRcFI1FzS3TFz3vJUt5uxJ1olAXRTEZrzxfJJj6midjGHPiqL27lrq9YXgeU970eaN9zx6WXVcTTZetrrBsosmypGG8+DQJRBUVKZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=asus.com; dmarc=pass action=none header.from=asus.com;
 dkim=pass header.d=asus.com; arc=none
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com (2603:1096:400:28d::13)
 by TYSPR04MB7446.apcprd04.prod.outlook.com (2603:1096:400:468::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.39; Thu, 29 Feb
 2024 11:18:29 +0000
Received: from TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6]) by TYZPR04MB6596.apcprd04.prod.outlook.com
 ([fe80::ceae:2258:3883:29e6%3]) with mapi id 15.20.7316.034; Thu, 29 Feb 2024
 11:18:29 +0000
From: =?utf-8?B?S2VsbHkgSHVuZyjmtKrlmInojokp?= <Kelly_Hung@asus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Kelly Hung
	<ppighouse@gmail.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: RE: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Topic: [PATCH v4 1/2] dt-bindings: arm: aspeed: add ASUS X4TF board
Thread-Index: AQHaau7/wxirtNaLSUCSFW5CqYQ6J7EhHDuAgAAORkA=
Date: Thu, 29 Feb 2024 11:18:29 +0000
Message-ID: <TYZPR04MB65960D379D89A5C3C4A0B13B9D5F2@TYZPR04MB6596.apcprd04.prod.outlook.com>
References: <20240229090913.1892215-1-Kelly_Hung@asus.com>
 <7f60e293-8076-4a06-9b6b-35f9c19578c4@linaro.org>
In-Reply-To: <7f60e293-8076-4a06-9b6b-35f9c19578c4@linaro.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=asus.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYZPR04MB6596:EE_|TYSPR04MB7446:EE_
x-ms-office365-filtering-correlation-id: b96b1c7f-624d-4593-0659-08dc39182842
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZKN/9yvFkdKt+tjygzu7951VUQZF7uI2ki8GQhgwTd1Aw2FSoCeYXj7qOTSYsgfbRcxcpgsSAsnAubmgkNF6rKjGDL9mIFJh3hNgaNzGONWyI+8xgIaKjsZa+Wms9dnfHCgnKexjO9/uQNWLvwZUxX9h25bI9CPynVNHJqmdmIERtAl35AvaicM4PTqDNWvHSVFNmZsMZT5jDOs8kAbtrcYuudxswoWMaJLfCB3YIdhm2L91CZNH1Qou0B5Zmu9J4iT+sjE278RCZPLSUEKfHr6OaOFVnd/91/AtIhCX9vA3lX4sLn3LQ/JtrXF4FqKA4VsbOYHO41rz5LUE1YTbpYT3OunjrnQg89HlwzpfZVctGQlsTeMiMZngV5fA0YpTSfqkuVnVMenDZQa9nZOG9hnv2GXD288XxL6ySmIW91+K8HmOBTeHaMKkhWn0E2mH0hnsRQ43Q0cZoPqECLwU4Jpc5h8vebdxwbOA/4V53UG8E4AVw0PaoYUOnb/bLoT5IssiAbBkxy2+kcTF4QLllMoM0akj5YgqZSkC1s6FoJ3K4tezJF1TH5bHcoVSjTbmYDmmq6RJcj0TtuGTfjFhvUDhP1Ne4yy1rcnORuXGfhrbsddb746hKQc5RdxijWStL3Cg8Ggkcl1pFomkdaX7FrdKO8j9bwsVDVpenXL8uGA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR04MB6596.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MlFTWnJ1Skg0UGFoWDBlUmtSUzBZODZBVnVZZDlWMklqbFQ4a2dTenJZMitD?=
 =?utf-8?B?WE1tWDBFWTMwWjhJRjVVZDI1RDJkTFFZcE9GeWdWT3lxVlVtczdmTDdKaVRi?=
 =?utf-8?B?YTVEM1RtZDl4MTNSR0Nsb29CY21tMXFVbS9Oa0xRTmNocFRreGxQcms2VXo3?=
 =?utf-8?B?V0pFWjQvVlJIRWs5MUJxWEE4aWMwRnA5cVVaSXFSQ3ZlcTFSak5QZUJQSWVP?=
 =?utf-8?B?TUhEdHdPeElXaEJCTG5DREgzdm03cUVERzdPeW5CSDc4Q3JFN1VBNEUycndK?=
 =?utf-8?B?Z3dPU2docXN6UEZuckZkekREdVphd3BEZURqWnhJYVhNYmVxZEhjZ2d1M1M3?=
 =?utf-8?B?cDBXMk5iNDAyUzFyMG1DWTMwWTNxQmJLR2hmcWpmYVFGUlRBSmhJaUh6aDlB?=
 =?utf-8?B?RURyQzhBTWo0aENnZCtvanIvN0RZR3FsZktoL0NhUGxYWDBPMExTTTRwSVpy?=
 =?utf-8?B?dHF5WElNSVJBOUhTMWJPQXVrMXJkcWN4WEUxeTlkaFZkYnFBbUxsR25kdDVD?=
 =?utf-8?B?dW1QMldDSjJvc1FFZW84ZTV6Q0lERDFFVUg0cC9uQnNTYit4Q0FtZ092cjkv?=
 =?utf-8?B?Y2R2MnlsTlJYaFFLc3dLVjNtbXVMMkJsZktuWTJnb2F4bXBnVnN3bE95R2Iy?=
 =?utf-8?B?RVNFSVJTSXArVEYwYTh1OW1FTzd4dWlNdlNOSkNGK2d3R0ZudlB6b1NycjEv?=
 =?utf-8?B?ODUwZEo5MUszS2RLUEJuaTdLUmt0WExRS1hiREVBZSthbmxlU3pGTk5GZkxZ?=
 =?utf-8?B?UGwzNkVMZmdEaklTYXBIbGRLcFVlbUQ3MUMwUWNqbnovbXIvVHlzMGhnR3d3?=
 =?utf-8?B?bXZsNE92MGREd1JzaFJVWkwrM0t5dnNubFg0eVJsNGY2ZmJTQnJvc0VWTzJG?=
 =?utf-8?B?YiswNUNjYWo5MjZwR2d2OUJzMm9GUTVvK1NUanlHZkNmZnhod0cyZFk0aUdH?=
 =?utf-8?B?Z2x4QmZVY21vektCdmVjWldwSlVyVldabEdSZC9EWFRPMGQyMjVqTFdhWSta?=
 =?utf-8?B?OXdqSW9SU0c5SzE3U1JEUmhoUnpSQitNUVJPU09uYUJKdlpZbnhMS0NTVmZV?=
 =?utf-8?B?cU9mVmp1UTl0QVBvYU5McHkrenJrRVJjaDVWUWVlNU8vTWhNMi9TSGlQcVFV?=
 =?utf-8?B?UUszSlk4YndnQ0RsbGRRU0VMbk5UQy9MUEpvMkZrenZ3VVFCVTcveXB6S0JU?=
 =?utf-8?B?eW9ZKzlnb1BLeUtTeWxLTGMvQUZRaHZoQmFJWThZMjBKUURGL2hDSWdFNi9C?=
 =?utf-8?B?Q0tIQlphczFLU1VXd1JWaFk2a09sYjZWNGhXK2VBdlZSN29jUFhVeGQ4b3ph?=
 =?utf-8?B?dno4enRsS2RPbmg5RENVdkcvRWUrL2dnajBPLzNNTTNkMkNlTnp6ZHZBVnFR?=
 =?utf-8?B?Nk5NZVRlOE5MVmppUEU0NXRIME9ZQUtNOTlZd3JGL0V5Z0twV3ZWVHRHWVF3?=
 =?utf-8?B?cDVKM3RXZVNBRDV5WUVZTkdBMUFsUHRDeW9WRnVadTdDaUtCUDJyaElUTkRP?=
 =?utf-8?B?aXB3NUdMTEFwRE8yMXEvVnJzRTBCcXF5QVFPamx6UjNlYm1WVnp5djZxZmpz?=
 =?utf-8?B?S0xoaWZiUnpCMElKNjBSdjlNOHhoUUltUWpvTEh1b0xtY0NJamF3alRJZTda?=
 =?utf-8?B?b01CdCt6MzhhNGpHN0VkTGdGVmViSnd2Y2xZTWZqRlVJQkhiQmtNZ3plYzQ1?=
 =?utf-8?B?c2V5bXNRTnRqWkNjOFlQNVdoMUV3bUROelZwcWNRU1U4aC9Ud1BQNjdwWkNN?=
 =?utf-8?B?RG41L29TY05wVGZheGY3QVJUUHJybGY1ZVdRa05yNjdDT2Q3U1B1M3NxQ1ZZ?=
 =?utf-8?B?UUR5bFd4VG1ScFJabTFUVWREYU5teFh5RThNNjJkNzdXQmFSRXpJYnhWSGxy?=
 =?utf-8?B?cGlveVRtejdQQWpnT2RoR0dBaDlJS1ZleEE5cUFWZndsa2FiWTZEZGxrNmZk?=
 =?utf-8?B?SzhyOTBOeHpQMEJFZ2E5dks1OWhXYVlnLzFPYTlWQ3M1VEl5VWQ1R0ZVRkVt?=
 =?utf-8?B?K2RJWjJYNnZRMWxIaDNGcHJycnlZTHk0azU0UTBzSzB2NjhrdVNERm8rRmxV?=
 =?utf-8?B?K2UwajJJRitJdThOSm5OdGdab1dUTCtVZHVraEhVVHgyMVRuWG1XTTBpNnVy?=
 =?utf-8?Q?9EeIxBD3NokuXA8CjeLDDgiQJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYZPR04MB6596.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b96b1c7f-624d-4593-0659-08dc39182842
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 11:18:29.6880
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 301f59c4-c269-4a66-8a8c-f5daab211fa3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /oQlHkyeRvWvzlQO7oNaGXMJ39H4/N+rAMUjQx2XU4oOAh/KBEX6zWre3kpLRvO8HJCXsZwS69OFh000bmSD6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR04MB7446
X-OriginatorOrg: ASUS.com
X-TM-AS-Product-Ver: SMEX-14.0.0.3197-9.1.2019-28220.004
X-TM-AS-Result: No-10--16.334800-8.000000
X-TMASE-MatchedRID: QW5G6BKkLTr5ETspAEX/nnOjEKYddvv6hp8n5idm/1/O95bDuvZ8cAS2
	Gc2Hma4Dr5jHbgW2EnyaewO4M8FPU6JFGUu+CrpxJw66cQh/R5edVbkPpTjx92sJ4MtDj+55jdZ
	RMD9bAkBsx/PsYgF5jqj1dopEA9NuO1OleWBM/6fj1g+YvHmvJqOIgmpEUTFNk4LIwXd8Df98d4
	PJSBUIXx3v1Kaf+HnE/ZVOcmjy9mG5n78ONXX6xlZB3ebKuqDZrgHRad4fjE7twylFlBYiLK+eC
	SMeOiOkixsDakoPlQbeIZDB2qZ/c7/a0nd+hIFCwPd9fpjXfbDS3Rxy14J4N655Bei8Vt3qzbx5
	KBOxE8l6iesAVu4yFD9IyksyoCKJXwjihSrlWBo=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--16.334800-8.000000
X-TMASE-Version: SMEX-14.0.0.3197-9.1.2019-28220.004
X-TM-SNTS-SMTP: 	DE2F1B7259CABEE45246153120CCBDC68C330EE63819DF8C1D1F742294BF4D8D2000:9
X-Mailman-Approved-At: Fri, 01 Mar 2024 09:01:43 +1100
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, =?utf-8?B?QWxsZW5ZWSBIc3Uo6Kix5bm85bKzKQ==?= <AllenYY_Hsu@asus.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGksIEtyenlzenRvZiwNCg0KSSBhbHNvIGNvbmZ1c2VkLCBpZiBJIGxvc3QgYWxsIGZyb20gdjEg
dG8gdjQgY2hhbmdlIGxvZz8gSWYgdGhlIGFuc3dlciBpcyB5ZXMsIEkgaGFkIGFkZGVkIHRoZW0g
aW4gdjUuDQoNCkkgZm9sbG93IGV4YW1wbGUgYW5kIG1vZGlmeSBteSBjaGFuZ2Vsb2dzLCAgaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNS1yYzMvc291cmNlL0RvY3VtZW50YXRp
b24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0I0w3MzYNCi0tLQ0KVjQgLT4gVjU6IFVw
ZGF0ZSBhbGwgY2hhbmdlbG9nIGZyb20gdjEgdG8gdjUuDQpWMyAtPiBWNDogVGhlIG5ldyBjb21w
YXRpYmxlIGlzIGEgQk1DIGZvciBhIEFTVVMgWDRURiBzZXJ2ZXIgd2hpY2ggdXNlIGEgYXN0MjYw
MC1hMyBjaGlwLCBzbyBjb3JyZWN0IHN0cmluZyB0byBhc3VzLHg0dGYtYm1jLg0KVjIgLT4gVjM6
IEFkZCBhIGxhYmVsIHRvIGluZGljYXRlIGl0IGlzIG5ldyBjb21wYXRpYmxlIGZvciBibWMuDQpW
MSAtPiBWMjogUmVtb3ZlIGJsYW5rIGluIGZyb250IG9mIHRoZSBzdHJpbmcgeDR0Zi4NCi0tLQ0K
DQpUaGFua3MgZm9yIGhlbHAuDQpCZXN0IFJlZ2FyZHMNCktlbGx5DQotLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KRnJvbTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3Nr
aUBsaW5hcm8ub3JnPg0KU2VudDogVGh1cnNkYXksIEZlYnJ1YXJ5IDI5LCAyMDI0IDY6MjEgUE0N
ClRvOiBLZWxseSBIdW5nIDxwcGlnaG91c2VAZ21haWwuY29tPjsgcm9iaCtkdEBrZXJuZWwub3Jn
DQpDYzoga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBjb25vcitkdEBrZXJuZWwu
b3JnOyBqb2VsQGptcy5pZC5hdTsgYW5kcmV3QGNvZGVjb25zdHJ1Y3QuY29tLmF1OyBkZXZpY2V0
cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3Jn
OyBsaW51eC1hc3BlZWRAbGlzdHMub3psYWJzLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVs
Lm9yZzsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnOyBLZWxseSBIdW5nKOa0quWYieiOiSkgPEtl
bGx5X0h1bmdAYXN1cy5jb20+OyBBbGxlbllZIEhzdSjoqLHlubzlsrMpIDxBbGxlbllZX0hzdUBh
c3VzLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMS8yXSBkdC1iaW5kaW5nczogYXJtOiBh
c3BlZWQ6IGFkZCBBU1VTIFg0VEYgYm9hcmQNCg0KRXh0ZXJuYWwgZW1haWwgOiBFbnN1cmUgeW91
ciBlbWFpbCBpcyBzZWN1cmUgYmVmb3JlIG9wZW5pbmcgbGlua3MgYW5kIGF0dGFjaG1lbnRzLg0K
DQpPbiAyOS8wMi8yMDI0IDEwOjA5LCBLZWxseSBIdW5nIHdyb3RlOg0KPiBEb2N1bWVudCB0aGUg
bmV3IGNvbXBhdGlibGVzIHVzZWQgb24gQVNVUyBYNFRGLg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBL
ZWxseSBIdW5nIDxLZWxseV9IdW5nQGFzdXMuY29tPg0KPg0KPiAtLS0NCj4gQ2hhbmdlcyBpbiB2
NDoNCj4gLSBUaGUgbmV3IGNvbXBhdGlibGUgaXMgYSBCTUMgZm9yIGEgQVNVUyBYNFRGIHNlcnZl
ciB3aGljaCB1c2UgYQ0KPiBhc3QyNjAwLWEzIGNoaXAsIHNvIGNvcnJlY3Qgc3RyaW5nIHRvIGFz
dXMseDR0Zi1ibWMuDQoNCkFuZCB3aGF0IGhhcHBlbmVkIHdpdGggdGhlIHJlc3Qgb2YgbXkgbWVz
c2FnZT8gRGlkIHlvdSByZWFkIGl0Pw0KDQpCZXN0IHJlZ2FyZHMsDQpLcnp5c3p0b2YNCg0KDQo8
cD48L3A+DQo9PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PQ0KVGhpcyBlbWFpbCBhbmQgYW55IGF0dGFjaG1lbnRz
IHRvIGl0IGNvbnRhaW4gY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIGFuZCBhcmUgaW50ZW5kZWQg
c29sZWx5IGZvciB0aGUgdXNlIG9mIHRoZSBpbmRpdmlkdWFsIHRvIHdob20gaXQgaXMgYWRkcmVz
c2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9yIHJlY2VpdmUgaXQg
YWNjaWRlbnRhbGx5LCBwbGVhc2UgaW1tZWRpYXRlbHkgbm90aWZ5IHRoZSBzZW5kZXIgYnkgZS1t
YWlsIGFuZCBkZWxldGUgdGhlIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBmcm9tIHlvdXIg
Y29tcHV0ZXIgc3lzdGVtLCBhbmQgZGVzdHJveSBhbGwgaGFyZCBjb3BpZXMuIFBsZWFzZSBiZSBh
ZHZpc2VkIHRoYXQgYW55IHVuYXV0aG9yaXplZCBkaXNjbG9zdXJlLCBjb3B5aW5nLCBkaXN0cmli
dXRpb24gb3IgYW55IGFjdGlvbiB0YWtlbiBvciBvbWl0dGVkIGluIHJlbGlhbmNlIG9uIHRoaXMs
IGlzIGlsbGVnYWwgYW5kIHByb2hpYml0ZWQuIEFueSB2aWV3cyBvciBvcGluaW9ucyBleHByZXNz
ZWQgYXJlIHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBkbyBub3QgcmVwcmVzZW50IHRo
b3NlIG9mIEFTVVNUZUsuDQoNCkZvciBwcmljaW5nIGluZm9ybWF0aW9uLCBBU1VTIGlzIG9ubHkg
ZW50aXRsZWQgdG8gc2V0IGEgcmVjb21tZW5kYXRpb24gcmVzYWxlIHByaWNlLiBBbGwgY3VzdG9t
ZXJzIGFyZSBmcmVlIHRvIHNldCB0aGVpciBvd24gcHJpY2UgYXMgdGhleSB3aXNoLg0KPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT0NCg==
