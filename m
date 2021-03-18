Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 058D534063C
	for <lists+openbmc@lfdr.de>; Thu, 18 Mar 2021 14:02:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1Ry8092nz3bcW
	for <lists+openbmc@lfdr.de>; Fri, 19 Mar 2021 00:02:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=I/ozB+SH;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=I/ozB+SH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.130.112; helo=apc01-hk2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=I/ozB+SH; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=I/ozB+SH; 
 dkim-atps=neutral
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300112.outbound.protection.outlook.com [40.107.130.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1Rxr2F8Pz2xg5
 for <openbmc@lists.ozlabs.org>; Fri, 19 Mar 2021 00:02:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNvW2kgz6hTpu36N8/VJSkwjxNUfHutO18dOlOdpxMM=;
 b=I/ozB+SHu0VzbhoqAjapiEp2t1t+ir02ubjJ/4nNwvScYcy8lx1tvAGAznfuYpgP3nwOfLFieDaHC8GNqgctQD/sVcyLVreYiiSUgp4YV8XFKnTRTwtd/7+8HgV/vxOvwds/l7bem0K3UBx/QnNVaeWK4yWrHpgB57eUX33g3stF9D4jFxEdsrVRTjMMPQMGscHl3mZ0mXC1CQ5V4pot8kdw5ysKqctKKqPhV81okJ6uOu71yRlo+yx4+iELaJHUrnqLbO0FHKpvJ/OOG2gaSCG74AkXs5ACWtCVg162Qb2Qi5RmnsWJfN/EaE7p0/3azsnHNELufKDPtPcQEnS6aw==
Received: from PS2PR01CA0053.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::17) by PSBPR04MB3992.apcprd04.prod.outlook.com
 (2603:1096:301:5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Thu, 18 Mar
 2021 13:01:44 +0000
Received: from PU1APC01FT026.eop-APC01.prod.protection.outlook.com
 (2603:1096:300:57:cafe::c) by PS2PR01CA0053.outlook.office365.com
 (2603:1096:300:57::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Thu, 18 Mar 2021 13:01:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.54)
 smtp.mailfrom=hcl.com; intel.com; dkim=pass (signature was verified)
 header.d=HCL.COM;intel.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.54 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.54; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.54) by
 PU1APC01FT026.mail.protection.outlook.com (10.152.252.235) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 13:01:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NoWVMYv4Q4Sh2toacmDpJXsNvX8U2ElnWLJJVrutwZVthzbmuSIrjxWor+eDnKSC/21JsUCgDTIkFv/cuXj/FFIkQVhDinyqiec0FGEt0tYDjqe0w/gvezVgJLSfyZbqf+l2ZKo155c5hEnb2wq6A9mVWdZjHmIDnorQW0Y63AyRrxNVETzvtCmH2Jik20Qed9B+2c7ECE4furdtOkhSE3BJiDG4jrbXhmlacNEuN7eq6ONhY9laEWJxre3xJ2LLxlz8jvG1un7f/DUm35OHPetQ7TNuI8P9TGYjYFe02hT02YDUTeA8b17/Ll4882HRK4QwB5M6OXwGw/rh6r7wfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNvW2kgz6hTpu36N8/VJSkwjxNUfHutO18dOlOdpxMM=;
 b=KDkZUUb5Z88UGSQd/nW+xMs7Bz8+H4WNiMteSu5larqoDI8knfjMPIJRuZZRJ34Cu60vW5adz5WLVHhR6R6U9+gqjpLP/gmA8GwJkBxWqoJGPEVp1r9DdsYTDJJ0tObvUfibf74FPmi+UPL/4k338m2+R5vXjmvSYAHmLisPsMJJrKlnqIs7qTyGYuIQf6ygdsKWiYEbjJnQG7qyzWl6A1VT01OS+kaYZDTRGzgUJQSH1mKBZ2adWotwCN3cKjhIZ2wr6+QEPBOPPOKB3tnsR2Ka5/EXpVau8enZLngBynvV9xwxhe3GmEIUFM5pHRTb6qxY5EYPDCQn6Y8pmnMEHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNvW2kgz6hTpu36N8/VJSkwjxNUfHutO18dOlOdpxMM=;
 b=I/ozB+SHu0VzbhoqAjapiEp2t1t+ir02ubjJ/4nNwvScYcy8lx1tvAGAznfuYpgP3nwOfLFieDaHC8GNqgctQD/sVcyLVreYiiSUgp4YV8XFKnTRTwtd/7+8HgV/vxOvwds/l7bem0K3UBx/QnNVaeWK4yWrHpgB57eUX33g3stF9D4jFxEdsrVRTjMMPQMGscHl3mZ0mXC1CQ5V4pot8kdw5ysKqctKKqPhV81okJ6uOu71yRlo+yx4+iELaJHUrnqLbO0FHKpvJ/OOG2gaSCG74AkXs5ACWtCVg162Qb2Qi5RmnsWJfN/EaE7p0/3azsnHNELufKDPtPcQEnS6aw==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2283.apcprd04.prod.outlook.com (2603:1096:4:3::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Thu, 18 Mar 2021 13:01:41 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::f4f5:46fc:706f:2eed%5]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 13:01:41 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: "Ren, Zhikui" <zhikui.ren@intel.com>, Ed Tanous <edtanous@google.com>
Subject: RE: Negative value returns for sensor in tiogapass
Thread-Topic: Negative value returns for sensor in tiogapass
Thread-Index: AdcMHNUlzX6I6Je8Q2WRGNkpWs0ATgAP1CQAAeFPK8AAFO7oAAAoI65QAYo5M+AAFhb5oAAn6eyg
Date: Thu, 18 Mar 2021 13:01:40 +0000
Message-ID: <SG2PR04MB3093200FCC2EFB0896D9D565E1699@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB30939CC20F08C50A7031DBA5E19D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CAH2-KxA4tQvaxzFcAWYhYrq9WeCLrLTRdknZW66XUBzOipoFrg@mail.gmail.com>
 <SG2PR04MB3093F7CA1D6801FDF9D6C5BAE1939@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <CACWQX80yb9PiT5S=rg_xOBiqJgETwRHekN=dE18rtxKKPuWfPA@mail.gmail.com>
 <SL2PR04MB30975F3703CAFEFBC1328025E1929@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <SG2PR04MB30938BD2D16A0956E2BEEFD6E16A9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB441097913A35ADC1B63974E5946A9@DM6PR11MB4410.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNzFkYThjYzEtYzJjNC00ZmI5LTg3ZTUtOWEzMDQwNTlhZTliIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6InF0ZVJoY3dyZ2YxaDFvUVV0SlhrcVBxSXpjK3dxQ0grNlNcL21SK0V0eDVJaDdLRjZudUsyRTcwSWFCaG5hU2syIn0=
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [157.51.2.176]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 8947b52d-4c9c-43ae-dfca-08d8ea0dfaf3
x-ms-traffictypediagnostic: SG2PR04MB2283:|PSBPR04MB3992:
X-Microsoft-Antispam-PRVS: <PSBPR04MB3992638928683A4B02D8D5D5E1699@PSBPR04MB3992.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: UryBgZ1UGpzzco3ONqVduphIpJOGD/I96axGp6jS56HLVEjvfERwJyxK0vg6yqaDDzUkjjU+Mc3uZyZpoRPA0tk3XO399s03AfTW+XehGQVOpOyGUgVaFEtvHoCbBKBzuyXQd6zMY0BELpSElGFOmjkK6ZkDNoyrR7Q/MnSosoStYzP4i4O5bbtkpiJF4VhEueGzCFLmguUCYoGtVrFYvomtELAiQAMJd15Rxftms8hJQ6kFIbTCrt8mvxSDPRMmqutC6vusaq05mPpDslYpeTOLMfGtc7AwnODy80MI3H/cJfJzb2Qj+L/nNVBv4nK9BkgMIqPRwcTJeYI/Oh4j/ykYFusxCI9fEOUP5nsDSLE9l5WDurRdy5f85l30DNDfHvuEAQHletcTQVRkn1xKsJwPlicsv4CNpj4Lyplo3j1kIpSrkBvYb325GqSUNOkfE0LqInBLbvyZHxlHGczaYPPuKjKZWAOs9BRSpWcwNTZcPGUExOlt3ngOjM6RaYmJobY36hfozXPwJ+rm6JIrcYydf4Ocv2RMQ+vPnhPvLylR2uB04u5KB9uYG/r42UWcNYB7jFFR5WTWiwj/NTahvF2Pc7FmRxhnV3x1tFWVpW821JgmkCVZAHFxJxfg9ToFjEYGBHiHvEZHIpcSxw1jR9lgenw68U2HEZ0KSyYbNnOF+8wJJhFFf0iIB+xdNold9lGsMByU1RGWancsJ4Yk9g==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(6506007)(53546011)(8936002)(966005)(2906002)(38100700001)(71200400001)(110136005)(33656002)(86362001)(55016002)(5660300002)(66946007)(26005)(7696005)(316002)(9686003)(186003)(52536014)(76116006)(64756008)(66556008)(83380400001)(8676002)(4326008)(478600001)(45080400002)(66476007)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?MJDx0DVFJxgtopwIjZC7neKY7sYpUoWFQs71FrQ/ur4ckKQUEidi2O+1DUV9?=
 =?us-ascii?Q?5PBbjyyFh+Fy0ZwY4AGDkwVstdPm5oHWrjD4n2gQRKNk95n+D3x0bSKvwhAS?=
 =?us-ascii?Q?wn66t9ACtRoIIH6xrfN+3U6c64HhYaieOancmep428E5BzoGZDI6/f7m1Jyz?=
 =?us-ascii?Q?XMyC0jmyUlkiyXRaE/P7NxaHIjLFubXFATmWXuBkcvRXA1xQSGu834AlB6F9?=
 =?us-ascii?Q?caH4Qf48f2yzldXkeCtmq+Pm6bte42IboRsXvVeXdYBnlS+6c6F1zDXXm2Dn?=
 =?us-ascii?Q?xQCsrGVUUDwK4ri0QAEfzoiplesLzc4CWrcbHW1VfH739MZmmwzyTONRD1pB?=
 =?us-ascii?Q?00Jit2Wy5GGXloiMryPrwsm1pTHul1xZfV3hjqfpvEgtK7hK9tdkwDfAstbL?=
 =?us-ascii?Q?PXJIYciHLLAyNHDDHI/G+mk6DmTQ1Oru+kxLWTm190kv/GOdcnLT5pMB/ggd?=
 =?us-ascii?Q?KTiuSDFbLzxQefT1CU/jAU1ihY3M1BOq4VwatooZJAQwsw8R7sL5FvcJUxUF?=
 =?us-ascii?Q?EtNgLCHzegQqB6/y8Zu+nImLxGLzu8u0V81RpX9AT6PfPpPEr9NidQcvC0+p?=
 =?us-ascii?Q?RPWutO0ElxEjZIt+KYv7Cp7f1tSB03TA94N/IYuuAMnvi71da47N1bUBBJLp?=
 =?us-ascii?Q?ViD8wuvU01CLEmSxC3Y/32twbuwSueDCtT5IXtJFNR2R8AOS5FUvdqe34JrY?=
 =?us-ascii?Q?aof/cVlQiEVTcpA0MQUuK2iZBqI1KEjRpI/VWS3kXihvjl2HVbmTKQTUUa8b?=
 =?us-ascii?Q?FdxwkJbVahFGXYk+PW7yHIOsP0hL/tIjFcOTm32bmRd1PB7YOSJciTioraFZ?=
 =?us-ascii?Q?BfdVjKt+heUt0ZyQb+cHD4eizjVn2XYTf2DktXx783dmtvXavLRYI6fG9zqx?=
 =?us-ascii?Q?H9IzgxiOUaPZEVYpaYOstN7WeNg/P3bQUvquwfUKVi71RUpjtUUOvAUXG7Kk?=
 =?us-ascii?Q?WBO4XjotTs25dmDXeakbmVJEnGThpOlYghoBSw+1VY3dCUcSJmamSsLJ35hf?=
 =?us-ascii?Q?LMciuPHmAwdEX9zHOLZuisE8CqWRiQsLW/BTw0vZVJ+ZcVNIb6HJQaC6A+zo?=
 =?us-ascii?Q?OgQsASaXa8r0kIM8GbjLm1pSc32I3hx08V5VX6sXKETlPPayWh7WM5IV0Ckh?=
 =?us-ascii?Q?F1s/DU3Wa4AVTX7jiTGwt5LiUCalntzejvIZ7ArDDOmgpLz+gPuKh4/4U7vB?=
 =?us-ascii?Q?mnVA/Y2jJ0yD0SbpM8xTN9Sb37zOzGbjz2BDRDLeU26IwZRR+fn0u/Hxq4kG?=
 =?us-ascii?Q?AJc8Hw60qp5wV8rQtHhXu3Cdjb2PUQYgmpt/yOJxjFKuJQujOgGhA4q0I0GK?=
 =?us-ascii?Q?2qs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2283
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: PU1APC01FT026.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 03f1fb17-6c87-4ad2-4c09-08d8ea0df944
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2uITp2Ll7WqfarpFBcsZGWMa5iF27P271EEBbDh9qCRVsjDDC+u2PYCpv78EvcUJwr6CW6R5CePNqknKrfwRjlcysoUTKuynke4gPOCEHEFIWgLEsKlV/y3C8c4ad9WWN9aMgQSADADPMMlyKI8yDaer3e+XRjU+xqz//LE9+eqlmVyuO7mKyRM01nfLvwB24fDjLkiowuTUw/Jh94AW5ZXBjo3ts21f89+3JNwz3H/z3KvMd2inHLOSE+oGW6klx6/zh823ueBcTeLO2ap1PwGZTNwhro2hIYMs3JiAzHb7z74LTQ7NIXcWc/jB3AXEMkzCje29+5CTIGRuc2biUpkaM7Fr+2jaEAEiLvcYAvzeFqvykexWxSQlh5cQxCkFyadbraOPymVE5EW9GNZ3nmTCWAMeeCUhtiQsTxK8oYGhXZd2UVJemd8PJAmwG70a+lEwgEnfr34GMXGiEkKCwkG0Ln0TPFOKb9xEjugX0eKPfgLApVrT8YUPLHoHvwQ82361eg6pHv1iyWnganqKXx9fWeYYXNr0j1hsTi1lGYdGJQYXgaUoCiZ0ewRJGbF9lgVUhJcTmFg989OwwX3H8ep4+hOitV/M84sk33rtJ+SeT9xmwwMD8o3HVRFyCOKaduZ38i8heqlxatCNAEv52FSgjxCoPfjvVh2f0jMOt0JRbl1EB8OzNGPtJ2jDCVLEYrgKsdI8Vawqmf+S8omksfDQjlHUQFSbC5MIjudYoY8fznNatFRCjXJcbF4Kvjy9RddFVfD2MW32VZ4Uevh8T0R7gdr00ip7fC+XnzuJ6UQ=
X-Forefront-Antispam-Report: CIP:192.8.245.54; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(136003)(396003)(36840700001)(46966006)(82310400003)(7696005)(52536014)(110136005)(5660300002)(36860700001)(45080400002)(8676002)(356005)(6506007)(70586007)(186003)(70206006)(33656002)(86362001)(34070700002)(83380400001)(966005)(26005)(2906002)(316002)(47076005)(4326008)(336012)(9686003)(8936002)(82740400003)(36906005)(55016002)(53546011)(478600001)(81166007)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 13:01:43.3150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8947b52d-4c9c-43ae-dfca-08d8ea0dfaf3
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.54];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: PU1APC01FT026.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB3992
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Classification: Public



-----Original Message-----
From: Ren, Zhikui <zhikui.ren@intel.com>=20
Sent: Wednesday, March 17, 2021 11:48 PM
To: Jayashree D <jayashree-d@hcl.com>; Ed Tanous <edtanous@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: RE: Negative value returns for sensor in tiogapass

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

-----Original Message-----
From: openbmc <openbmc-bounces+zhikui.ren=3Dintel.com@lists.ozlabs.org> On =
Behalf Of Jayashree D
Sent: Wednesday, March 17, 2021 12:39 AM
To: Ed Tanous <edtanous@google.com>
Cc: openbmc@lists.ozlabs.org
Subject: RE: Negative value returns for sensor in tiogapass

Classification: Public

Hi Ed,

PMBus spec only have read and write format. In the below link, PXE VR uses =
11 bit format. Also sign extend the 11bit reading so that negatives show co=
rrectly.

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fopenbmc%2Fdbus-sensors%2Fcommit%2Fe4a970d9aea97c7c1a11c63215e7d3cda21=
24e54%23diff-135678dd2046935c5dd0be8e5a5a529d33231203149e786d57b15a3cc0cc12=
40&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C1f0d1622ed8e4cfdd79108d8e97=
10e18%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637516019071748468%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;sdata=3DJz4749uSr3qy7opyujowf98PmaVOwEViBuzKIT%2BK1v4=
%3D&amp;reserved=3D0

            constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
            value <<=3D shift;
            value >>=3D shift;

Could anyone from the intel team can clarify the need of above logic used i=
n IpmbSensor.

[Ren, Zhikui]  This change was made to allow negative numbers be reported c=
orrectly.  This can happen during test. Without the change, 255degree will =
be reported and trip threshold event incorrectly.
Exponent data is not used because it is always 0.

Jayashree]
We need only below line in the code to process the HSC sensors value for ti=
ogapass.
	int16_t value =3D ((data[4] << 8) | data[3]);

 Since the below logic is added, the values get shifted and getting negativ=
e values as output.
	 constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
	 value <<=3D shift;
	 value >>=3D shift;

Could you please suggest any idea to resolve this issue.

Regards,
Jayashree

-----Original Message-----
From: Jayashree D
Sent: Tuesday, March 9, 2021 4:48 PM
To: Ed Tanous <ed@tanous.net>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: RE: Negative value returns for sensor in tiogapass

Classification: Public

Thanks Ed, I'll check it out.

-----Original Message-----
From: Ed Tanous <ed@tanous.net>
Sent: Monday, March 8, 2021 9:37 PM
To: Jayashree D <jayashree-d@hcl.com>
Cc: Ed Tanous <edtanous@google.com>; openbmc@lists.ozlabs.org
Subject: Re: Negative value returns for sensor in tiogapass

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don't click links or open attachments as it may be a Phishing emai=
l, which can steal your Information and compromise your Computer.]

On Sun, Mar 7, 2021 at 10:17 PM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Classification: Public
>
> Hi Ed,
>
> In the below link, PXE1410CVR and ADM1278HSC are using the same reading f=
ormat.
> I am not able to find any information on PXE1410CVR. If there is any spec=
 available, could you please share it.
> It will be helpful to analyze both the specs and fix the problem.

I don't have any specs available for those.  I would assume they follow the=
 pmbus spec though, you might start there.

>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
> ub.com%2Fopenbmc%2Fdbus-sensors%2Fblob%2Fmaster%2Fsrc%2FIpmbSensor.cpp
> %23L144&amp;data=3D04%7C01%7Cjayashree-d%40hcl.com%7C8676d30f4d3a4dda1e0
> e08d8e24c4957%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C63750816456
> 8775248%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLC
> JBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5lhuUdfI%2BG75C8I1HDAaEH
> VP46%2Bz1r3nJV0ek3CiiR4%3D&amp;reserved=3D0
>
> Regards,
> Jayashree
>
>
> -----Original Message-----
> From: Ed Tanous <edtanous@google.com>
> Sent: Friday, February 26, 2021 9:57 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Negative value returns for sensor in tiogapass
>
> [CAUTION: This Email is from outside the Organization. Unless you=20
> trust the sender, Don't click links or open attachments as it may be a=20
> Phishing email, which can steal your Information and compromise your=20
> Computer.]
>
> On Fri, Feb 26, 2021 at 12:55 AM Jayashree D <jayashree-d@hcl.com> wrote:
> >
> > Classification: Public
> >
> > Hi Team,
> >
> >
> >
> > Recently, I have tested sensors for tiogapass, in which one sensor retu=
rns negative value.
> >
> > After analysing the code in the dbus-sensors repo, I found the followin=
g issue.
> >
> >
> >
> > dbus-sensors/IpmbSensor.cpp at master * openbmc/dbus-sensors
> > (github.com)
> >
> >
> >
> > From the above link, We need only below line in the code to process the=
 HSC sensors value for tiogapass.
> >
> >
> >
> > int16_t value =3D ((data[4] << 8) | data[3]);
> >
> >
> >
> > Since the below logic is added, the values get shifted and getting nega=
tive values as output.
> >
> >
> >
> > constexpr const size_t shift =3D 16 - 11; // 11bit into 16bit
> >
> > value <<=3D shift;
> >
> > value >>=3D shift;
> >
> >
> >
> > Could you please suggest any idea to resolve this issue.
>
> I haven't looked at this in detail, but we should follow whatever the spe=
c says here.  If whomever wrote this originally put in the wrong math (whic=
h seems likely, given they were implementing 4 types and probably only usin=
g one) then we should just get it fixed and do what the spec says.
>
> >
> >
> >
> > Regards,
> >
> > Jayashree
> >
> >
> >
> > ::DISCLAIMER::
> > ________________________________
> > The contents of this e-mail and any attachment(s) are confidential and =
intended for the named recipient(s) only. E-mail transmission is not guaran=
teed to be secure or error-free as information could be intercepted, corrup=
ted, lost, destroyed, arrive late or incomplete, or may contain viruses in =
transmission. The e mail and its contents (with or without referred errors)=
 shall therefore not attach any liability on the originator or HCL or its a=
ffiliates. Views or opinions, if any, presented in this email are solely th=
ose of the author and may not necessarily reflect the views or opinions of =
HCL or its affiliates. Any form of reproduction, dissemination, copying, di=
sclosure, modification, distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of HCL is str=
ictly prohibited. If you have received this email in error please delete it=
 and notify the sender immediately. Before opening any email and/or attachm=
ents, please check them for viruses and other defects.
> > ________________________________
