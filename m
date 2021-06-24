Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5704B3B2884
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 09:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9Wqq0D0cz307k
	for <lists+openbmc@lfdr.de>; Thu, 24 Jun 2021 17:25:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=hrAzAL86;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=hrAzAL86;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.134; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=hrAzAL86; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=hrAzAL86; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300134.outbound.protection.outlook.com [40.107.130.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9WqK68rKz2ym7
 for <openbmc@lists.ozlabs.org>; Thu, 24 Jun 2021 17:24:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHQzNkNRoSBkGvKApZnYvnQxJ1wdbstlH2hbGHTIg0o=;
 b=hrAzAL869hHN1TFW+dssQr7HsVHpzckUhVnpymeAJ29qwBS9l2JYxjFbORRPkvcum3jZXhye8e8+k14n9ydR/AxhVxIf2vtGp8+mphompDPizo355NUcSPVRgMvMF5SPkhNcj2dR4MVlwAoQYgDZboDv5ZkN7AkVdwGdPOFmKyUedRsM+0xG0fp2wsXSWrXZZ2W1V3w85zLZxQA87gU1j50FnTzubIC59aBOSSEqWurRhdby4GpNB6eJnUEmXRx+lKVhi/1baRw3YyU4uIJkakz4G9ogqKzZ9IZvycl1NaMwUaLKVVEgKEfmtHscug125zu5NkrS+d/a8r2S9FBg5g==
Received: from SG2PR02CA0092.apcprd02.prod.outlook.com (2603:1096:4:90::32) by
 SG2PR04MB2857.apcprd04.prod.outlook.com (2603:1096:4:20::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.19; Thu, 24 Jun 2021 07:24:34 +0000
Received: from SG2APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:90:cafe::5f) by SG2PR02CA0092.outlook.office365.com
 (2603:1096:4:90::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19 via Frontend
 Transport; Thu, 24 Jun 2021 07:24:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.56)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.56 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.56; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.195.56) by
 SG2APC01FT055.mail.protection.outlook.com (10.152.251.60) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Thu, 24 Jun 2021 07:24:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W4WlDS9XdQegIM0FrcWlqmMyUBDc1DftsGgEdwZ7ADV+ms4nvZ1lSRquLxudDTU1kAORaWWXkxNJXAccvP85j9usRCXVwhTIc8fkpeNx+JAIPpg6H6u9m7aNHOfqqpW8E8ZI7BD8ZVJPopwjM1pg7wMKAcNqCvcXDNbrvz4mDYvgYdIGzKLsicFxqbVgKM2ITW5G+QapCz8hfXsFYnaJlrfNfW8IeL4CAE2wC6VwTpMijA61vgg8fTmLH8lhFUG0fScxTxEXkzdTfhPUqO8pJ0os/71y/qp2ulfsCHmQfu8x6sHpoCUISiIK3YUIIuiIVC8QLMuGT9MNJQ83ZkgidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHQzNkNRoSBkGvKApZnYvnQxJ1wdbstlH2hbGHTIg0o=;
 b=AN0CIZUgAqpnMTz6+4eGww0+UK7MX0CTL9x50lwS1opeyiezFjuBOgtlsm5TsCeuJUBgd4WH2cJz3JYpebb/LJXrG+jkH4fMRURoUhA49uCL6MuRwPTheiTkzvOLZbI+p0tKejvZt3M5z1gGdLlj8oybojHQVSB/t/EDHSTXDN/8kyrlf1wwoDwvJclEydT96/6mTQUZOLAlmRsL8BaRAy5DVltUJ9bLqHGUayHbEiBZD19Bm5JojexNnxNV3PKm6cHQ1Ab0/5YHM9uCEqBfInW77GfNHCntfp0OXUJkpGEzK1fUwZHk1s1NIKkCbP7YOBjIbOrFjvlHYlshp4SJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHQzNkNRoSBkGvKApZnYvnQxJ1wdbstlH2hbGHTIg0o=;
 b=hrAzAL869hHN1TFW+dssQr7HsVHpzckUhVnpymeAJ29qwBS9l2JYxjFbORRPkvcum3jZXhye8e8+k14n9ydR/AxhVxIf2vtGp8+mphompDPizo355NUcSPVRgMvMF5SPkhNcj2dR4MVlwAoQYgDZboDv5ZkN7AkVdwGdPOFmKyUedRsM+0xG0fp2wsXSWrXZZ2W1V3w85zLZxQA87gU1j50FnTzubIC59aBOSSEqWurRhdby4GpNB6eJnUEmXRx+lKVhi/1baRw3YyU4uIJkakz4G9ogqKzZ9IZvycl1NaMwUaLKVVEgKEfmtHscug125zu5NkrS+d/a8r2S9FBg5g==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2812.apcprd04.prod.outlook.com (2603:1096:4:25::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.22; Thu, 24 Jun 2021 07:24:29 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::d93a:6771:3a9b:d411%7]) with mapi id 15.20.4219.025; Thu, 24 Jun 2021
 07:24:29 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Benjamin Fair <benjaminfair@google.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Rsyslog using Redfish
Thread-Topic: Rsyslog using Redfish
Thread-Index: AddnfrgX+SaI3p2qRYyZExRTaER9hgAFFxCAAE2MEWA=
Date: Thu, 24 Jun 2021 07:24:28 +0000
Message-ID: <SG2PR04MB30939D3F7E896DA3CB3CD449E1079@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093DD642B1D80C03EFBAF91E1099@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CADKL2t7rCZ2QYBQfvybYtaoZdKDFoPnJzwr8td_4Qg_=gtv4MA@mail.gmail.com>
In-Reply-To: <CADKL2t7rCZ2QYBQfvybYtaoZdKDFoPnJzwr8td_4Qg_=gtv4MA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMGIwZjYxMWQtYzAzZC00MDJjLWFjODEtZGIzYmQ1NmYyNDUzIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX0MwbmYxZGVudDFhbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6Imh3SVNMaURabHI5TGxDZ2Q3VnFYVDVZbVN2bXY2R2pBYmNLT2hWUDBFeXA4b3VDVG1XMTNRS0I1TW5RWmFmZzMifQ==
x-hclclassification: HCL_Cla5s_C0nf1dent1al
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2401:4900:234b:b0:a973:b1e9:89f:f7d3]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8be7ec4a-b2f4-49b1-fdbc-08d936e11d81
x-ms-traffictypediagnostic: SG2PR04MB2812:|SG2PR04MB2857:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB28578BFEF02E48FBD4732B60E1079@SG2PR04MB2857.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 4OI+YnsUl+RfnfHXrfLxRaXmVfz8YpBuolDuixOb+pjXVugJ5JPU46fNlkFCM5l0ntKBWqHUrC7G0a6jHrztfsojl4Rq/Ms7plN4FvqAFdofLrF3qkJ/P+psiYCuc50asBQPLWXpdFtWhvaBb6Qm4OTpZ80Ycx5eZJPdTpfRkFAOEV0TJB/ind15GI2VqjM8W/9puIMVDUUaTieFD/RruZoaakNlJMgwz+0xYDRvU5okezwo7GYTVZj4/f0iKix4C9qXYV5TJMwveMJFE3FKEewuc/1KQGf4B/aHLHkW4yXaFYonvdat2dWb1YDy5UjFj6dWQ1Yy5HZf9GaQcdLNz1On1CAhU75EvjCa25SIVnfaG1DCZY1jtXREy63RCx7RJ3EK3SfE12z0ovXFzkA9qFlKnzVsSxHEngjhsarbxzfrX2A6/n3LEDkCx+7XUQJJwc86BDOrHAD4RRPqiGiN2KT9m23kyDOwunD8BK9dDVCY4h0cSH7ojNaskGSWiZPzim1b7cDVOswpj0x8IfOhELnEN6/eGe6dSvWhzHlKXIlQk3DlzjA/8Zc3PNsXsdotBYO/T9DzdxdJYmM/s33gHhaGYmsuHKjZnRJBAlfKIGdyuaZokFhUIeADZXLdZbzUMNI55WKK0fkbPM8tT7dfAMpfHKmuI7fs/+efjZqC81JxA+gYsmYF+5naiSTJ97UOG/hqUP656AL4w4BwNXhDGA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(376002)(136003)(39860400002)(55016002)(966005)(9686003)(478600001)(83380400001)(3480700007)(45080400002)(4326008)(66946007)(186003)(122000001)(38100700002)(52536014)(66476007)(5660300002)(7116003)(8676002)(8936002)(53546011)(6506007)(7696005)(76116006)(66556008)(316002)(66446008)(110136005)(33656002)(2906002)(64756008)(71200400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R6WvwfmN2w6rrQieRXyBfUtg9KV9FgfaESn7LrXng00YvAjyxAerLFegEuME?=
 =?us-ascii?Q?lFOsScMZ4hl5oJAyM8wMXz0XKewN9lhUnYd78DH7LkYoAFGrMRWm3SOsCEly?=
 =?us-ascii?Q?iQ9+hNil+Oq0opj6rb4JEy2IHnBOjvggYo5a1GoKZIbTwdhNIDEvCfxR6Efj?=
 =?us-ascii?Q?BXQQdLwtn+zUaVcmXwg7KvT8xQ5zEBrpEpDZP7FSdlAlkgGW5NMV5ckxOwvg?=
 =?us-ascii?Q?1GWh+eWDnkgZEiFlEJQOhxuJJI/v3eiBXb+YKVP7i7c+omLg5S2RukIdYGze?=
 =?us-ascii?Q?4C65rdGgzbb7gul+7DmO5M/ENzDuwVG+N0jX/n5vU5wb1aPanNotboyUfG+M?=
 =?us-ascii?Q?4nGLMMD+bxjSVPxGjEciXwyNjhV1U6D0RM2uR5KDETMeM5h0i2Knp/2/VCpe?=
 =?us-ascii?Q?5oyVq7fJ6RMMxmSnR/MacVGr45IjAUMIJeGPxtKtpzIwHXu4em/jHBdcpsmP?=
 =?us-ascii?Q?Pxqxgzh6lnmR1ugO6WeLDIe/DKt1Lz1TcdaJWObfOM0k0XqW4xUn1Ue14rVp?=
 =?us-ascii?Q?wBK9wKfeEwaJPnVifYD3QbDFuOcKNWziNj0rvqOkB2EqqMEkvjn3CxBrF1mo?=
 =?us-ascii?Q?GM2T9kJHoQxu9/huWiwaCaHW6WX0LRIje+71iTXhFgAj69zqU/wBM+jurz2M?=
 =?us-ascii?Q?O9HIMTKQmHRjf0g7Y2DHY6zaswdyoMjLhg82wdt+Ew2e6hJ9axyFe26XtpkZ?=
 =?us-ascii?Q?n0nrjoHKvIUFzpsWOpKWYwytNRkBGUxOW7oq/th6M3R9++GRQTltBdylrHc7?=
 =?us-ascii?Q?wtWF9o3fnEfwBngk0h7BzHuB33JeuHzldhTSLA6LhyYdp5GNSIDMcuFCYCl4?=
 =?us-ascii?Q?XIAx1g6zzwLmdMt4wNZGicDuxWdGUFTxhGkcnvdRlHJJJH1Lx4oDjQaqwQzU?=
 =?us-ascii?Q?sMAV3FpfJuOLfT51ei5vPiLlNTHVdsKYYsZVdjzK+GDU/u39aBGoZImYEAX+?=
 =?us-ascii?Q?0z+yxvrqKbLqzxdtBcihtyopDTZQ4FsTqHUwFdvTqtfGXyPAojgeYYY/bw4w?=
 =?us-ascii?Q?nl+0P9ongnaQVpbXs33zsV9NAyuby33V9TbE0YjuxRMUQ3gH8ZPFdZ+bwcLO?=
 =?us-ascii?Q?XwDy6NjqOkbCVWvjFoAQL8NX2AM1spYh4Fj7ikMWreCxRKpeKcFdExTevE5g?=
 =?us-ascii?Q?BReoyrzuC6iaCH1mD/yOBoYv9itZQRfe5+5jxoG0nL73K/X8V+vGq8uI0PYf?=
 =?us-ascii?Q?mn1BkfoLBcrmtKGIzxP2JsRWOX4dmpyraEt92QXcsV4FEJ/RjYtlaHGNjV44?=
 =?us-ascii?Q?5DeFuQhDnuANMypOqrrlb3+R1l3Ij2/ieuop34fT/RdsInRIcxVjxqw1DMqN?=
 =?us-ascii?Q?Byd1fdyxj0UFXuPzfQBUDIOluXvWGI6zgvzCwRC9mJQRZ0jEsmZrCzOV+b8G?=
 =?us-ascii?Q?mP1+pbk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2812
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5aa67b94-2254-4003-ca57-08d936e11a86
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EYb2ItRCLeuLaZyJSmONP4IxsgJrRfNIASyGHXUphjrw7p28sbRHzXaSdC3IXG5YTtMbeLQ9lmyZh06fynv8zna6QwwQkFpw8IJsUCr7/xaXl84AgTB0lWPUkPQ3VTHnKro9kSsNHVNKDDj5efyc0yvqgbGNUnqrdvjmE5V3zDoOL+K6sqenGUHPtqa3iWgU92gjvuE/5fPLUGCH4hBN9vuKMMrq/Pa0BnpNUP2tsS79T5z/1tz0In3MeGqI8kalNclr+zQkXeJoQdC1giGzxdN41lETue2EoidH03WjEaTqkq5aUk2nbYgW2qWxCtC12OvJFDK0XyAq/k0sV9DP5B1h1GgDIFG5/SRObiSjzNzYqlRTCrNBZo9Hso9o/3rAJazqINgpxEsquPQR94rZIFAR9CUqQR5KWLMoa4z/r5o5TnWrXgozTSU1yQHRHFMco2AYmi59KPvX4LefHItX2BFu5i/eU/jBY/RECfZ1ieG4XEWlf2VnmbNtFaPK+59clhCnI80maDQN2q1pS9pp9VlLM9MhdzghMDOm0JYy7MasTY4NrHs8YnFVwYQ9+mb3fhqRO6l6TeZtRWEGFgzzu+ADpLmoJtpiNDsbpXVAS3a1f938NmGm4zckmgNBQpbcfl3RYzDk3TipM34BgYHVNmiDzxkUZ9JwtYg5EtUeyk0AnnL2JuGKOZMU2Zq3xPk+i6FZSl4scxOH4kFXuXFDyuTuh2sbah+bEnaxdOGo/icXA5u3KFCOsJo6hTPz1X17/aCSHIZaSUamBm5TMmM/UOLQ43R8DW/im+1cdqsJ/R1yHEhXsGx9j3qXBuKvPLto
X-Forefront-Antispam-Report: CIP:192.8.195.56; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(46966006)(36840700001)(110136005)(36860700001)(7116003)(966005)(9686003)(86362001)(336012)(356005)(316002)(55016002)(3480700007)(82740400003)(33656002)(36906005)(8676002)(2906002)(52536014)(83380400001)(82310400003)(45080400002)(186003)(53546011)(8936002)(4326008)(81166007)(47076005)(7696005)(70206006)(6506007)(70586007)(478600001)(5660300002)(26005)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 07:24:33.3868 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8be7ec4a-b2f4-49b1-fdbc-08d936e11d81
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.56];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2857
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
Cc: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Confidential

Thanks for your response, I will analyze those patches.

-----Original Message-----
From: Benjamin Fair <benjaminfair@google.com>
Sent: Tuesday, June 22, 2021 11:49 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: openbmc@lists.ozlabs.org; Velumani T-ERS,HCLTech <velumanit@hcl.com>
Subject: Re: Rsyslog using Redfish

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

On Tue, 22 Jun 2021 at 10:18, Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
>
>
> Hi Ben,
>
>
>
> I submitted the below patch in gerrit regarding rsyslog for my platform.
>
> meta-facebook: Add rsyslog for yosemitev2. (Ife76252d) * Gerrit Code
> Review (openbmc-project.xyz)
>
>
>
> Also, there are few patches in gerrit for rsyslog which you have submitte=
d.
>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerr
> it.openbmc-project.xyz%2Fq%2Ftopic%3A%2522rsyslog-refactor%2522&amp;da
> ta=3D04%7C01%7Cjayashree-d%40hcl.com%7C231eab0d9237443b100708d935aa4eb2%
> 7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637599827843605762%7CUnkn
> own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwi
> LCJXVCI6Mn0%3D%7C1000&amp;sdata=3DiKaXGLkHZjdSN2a%2BJIVUwV6vqZDzHpWJl%2B
> aCYiongCc%3D&amp;reserved=3D0+(status:open%20OR%20status:merged)
>
> Whether these patches will be enough to store the event logs in redfish ?
>
> or any other changes needs to be done for my platform.
>
>
>
> Thanks,
>
> Jayashree
>

Hi Jayashree,

I'm working on restructuring the rsyslog configs so that the Redfish rsyslo=
g actions can be installed from bmcweb and the IPMI ones from phosphor-sel-=
logger. Once this is done, you'll be able to enable a PACKAGECONFIG option =
instead of having to copy and paste the rsyslog.conf file into your layer.

If you'd like to help with this refactoring, you can review the changes in =
the rsyslog-refactor topic starting with this prerequisite:
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.=
openbmc-project.xyz%2Fc%2Fopenbmc%2Fphosphor-logging%2F%2B%2F44109&amp;data=
=3D04%7C01%7Cjayashree-d%40hcl.com%7C231eab0d9237443b100708d935aa4eb2%7C189=
de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637599827843605762%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;sdata=3D1NxN%2BCigm909eUcsxUet3xWkyJt4AvCSYSNBsmiSDLM%3D&amp;res=
erved=3D0

Thanks,
Benjamin
::DISCLAIMER::
________________________________
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or incomplete, or may contain viruses in tran=
smission. The e mail and its contents (with or without referred errors) sha=
ll therefore not attach any liability on the originator or HCL or its affil=
iates. Views or opinions, if any, presented in this email are solely those =
of the author and may not necessarily reflect the views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, distribution and / or publication of this message witho=
ut the prior written consent of authorized representative of HCL is strictl=
y prohibited. If you have received this email in error please delete it and=
 notify the sender immediately. Before opening any email and/or attachments=
, please check them for viruses and other defects.
________________________________
