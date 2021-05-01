Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD39370755
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 15:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FXV5V19wKz302G
	for <lists+openbmc@lfdr.de>; Sat,  1 May 2021 23:12:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=jkPAqjmU;
	dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256 header.s=selector2 header.b=jkPAqjmU;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.94; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=jayashree-d@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=jkPAqjmU; 
 dkim=pass (2048-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=jkPAqjmU; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310094.outbound.protection.outlook.com [40.107.131.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FXV561NYSz2yRQ
 for <openbmc@lists.ozlabs.org>; Sat,  1 May 2021 23:12:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FujZOoEIEUiCttCzEWrIWlcuBv0S0hbB5bAe6l3QqPc=;
 b=jkPAqjmUnjBjlgCQyBfu10VRtg5bjkrgT9qs5l5C2TCIoUHAJeDMYSOk1oueETzCuunwgM1j2b16YuqpdYIhqNX+Y88GG+P+SQ0VJhWMQbxhlMimy70hkj5uxJDAfiusl9Ecq1tqDDtyPy82EAzCjeRzdtWlkZkGKPSI8tvN+9TS2LhqaefazazX7mdEX0MkNTz5YoQ1xP7dyKQZA16WT6OopXC/mJz9ZuC9eSuf5apbjG2r5OFCBPRgtznYOK6lZhZ8XcMXqqcXJr2qc1CGHujMAowPHvKftQJgPEZzJsI3CNQWg/u7pEhZLVUzg90yqpc9Ys5IfAeL+wSx65QMbw==
Received: from HKAPR03CA0025.apcprd03.prod.outlook.com (2603:1096:203:c9::12)
 by PSBPR04MB4022.apcprd04.prod.outlook.com (2603:1096:301:c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.35; Sat, 1 May
 2021 13:11:51 +0000
Received: from HK2APC01FT055.eop-APC01.prod.protection.outlook.com
 (2603:1096:203:c9:cafe::1b) by HKAPR03CA0025.outlook.office365.com
 (2603:1096:203:c9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.8 via Frontend
 Transport; Sat, 1 May 2021 13:11:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; google.com; dkim=pass (signature was verified)
 header.d=HCL.COM;google.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=APC01-HK2-obe.outbound.protection.outlook.com;
Received: from APC01-HK2-obe.outbound.protection.outlook.com (192.8.195.57) by
 HK2APC01FT055.mail.protection.outlook.com (10.152.249.48) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Sat, 1 May 2021 13:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhDY9U4nrnM7wM5wxj8vF4rfXzFBfPh9RPptjOvhS7vrJcmEgI67ISB+O5jFclsbl9ydD0OwWWJCh9E/Szf3+IKAsS5jsyE5I695rLzAkZKJ7wJ5ZwL37XU5jMmG0dXICrMgKkbDTYPvQpm3HqCX1jK0Hbs+/JPpRJRuDVg4VdYwrxqkAxasaCyXdKH2ficajQJpqT5PmUIdNcWQtIRc72/z7//1HUFswvKldxyrP0UY4NgEvevtcvWGn29ge1pa2Thbl6r2UrPGfCBKsN7aAr46lNcZDn4KA5ZzKPu+w5g6y/qyDu9sKokgsURVl1J+SBRF8Z4WDwYAvc2rDq7Pxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FujZOoEIEUiCttCzEWrIWlcuBv0S0hbB5bAe6l3QqPc=;
 b=dXPunj1UDkiNRKInS8NlRHXkVJHfw1zryNrycyCeVodRMP8dpEY2l8pDRu06Kg6WB292e8MUcFNANFQsSugG1t8IyaRV9SUfdn+2AU19U3n8vbzgvmiQ3FdWDAW7h5crf7DcT/pJyROfgvE+7JRuQM4gROlXLce6Of/2+U1U6EaICpl3vc8eIOmNdhHwdQNLcLa7/qYmKGcUBediLx1TN1VxwRQXoXDhJRHm5DJ5LJEftzxL34v9NLnmTlEaftzcx7IuFHLuTFf6fZOUYRpxy3lIajZW9IVtcBNvJqBvXsjE8juJ3c+LKIumzTkNxjsZgXm1AAz7jrlXdR7Wu/eRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FujZOoEIEUiCttCzEWrIWlcuBv0S0hbB5bAe6l3QqPc=;
 b=jkPAqjmUnjBjlgCQyBfu10VRtg5bjkrgT9qs5l5C2TCIoUHAJeDMYSOk1oueETzCuunwgM1j2b16YuqpdYIhqNX+Y88GG+P+SQ0VJhWMQbxhlMimy70hkj5uxJDAfiusl9Ecq1tqDDtyPy82EAzCjeRzdtWlkZkGKPSI8tvN+9TS2LhqaefazazX7mdEX0MkNTz5YoQ1xP7dyKQZA16WT6OopXC/mJz9ZuC9eSuf5apbjG2r5OFCBPRgtznYOK6lZhZ8XcMXqqcXJr2qc1CGHujMAowPHvKftQJgPEZzJsI3CNQWg/u7pEhZLVUzg90yqpc9Ys5IfAeL+wSx65QMbw==
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com (2603:1096:4:6d::11) by
 SG2PR04MB2811.apcprd04.prod.outlook.com (2603:1096:4:1a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.38; Sat, 1 May 2021 13:11:47 +0000
Received: from SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9]) by SG2PR04MB3093.apcprd04.prod.outlook.com
 ([fe80::54f8:a70d:5570:fac9%6]) with mapi id 15.20.4087.038; Sat, 1 May 2021
 13:11:46 +0000
From: Jayashree D <jayashree-d@hcl.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Issue in displaying hardware name using Redfish
Thread-Topic: Issue in displaying hardware name using Redfish
Thread-Index: Adc9faE074rZmKWfSR+zByZ0gUXoggATN6+AAABbPeAAAjvdgAAtf09w
Date: Sat, 1 May 2021 13:11:46 +0000
Message-ID: <SG2PR04MB3093B61F1235FF1E26B78366E15D9@SG2PR04MB3093.apcprd04.prod.outlook.com>
References: <SG2PR04MB3093D4832CB9DFE036DAA41DE15E9@SG2PR04MB3093.apcprd04.prod.outlook.com>
 <YIwPtU8g5PhkLC6k@heinlein>
 <SL2PR04MB3097C0CCB579F0B2C2DBA0BFE15E9@SL2PR04MB3097.apcprd04.prod.outlook.com>
 <CAH2-KxA7yccRHOKbmzeKxXZfgcocd6WzfP0q-xrmsECZg=c4Ug@mail.gmail.com>
In-Reply-To: <CAH2-KxA7yccRHOKbmzeKxXZfgcocd6WzfP0q-xrmsECZg=c4Ug@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiMzlmZThiMDItYzg5MC00ZWYxLThmNzEtY2M4OWFmZjhkZTgwIiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiSENMX0NsYTVzX1B1YmwxYyJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IkIxclpcL2E2YitFa2k1RDV2ZkJuZ0RPMHo5REtpQ1wvcjZNYjZmZWRSUzJObmlvVTVEeFlOVmtaRjlqVGxra1U4dCJ9
x-hclclassification: HCL_Cla5s_Publ1c
Authentication-Results-Original: google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [2409:4072:649f:2e7d:7477:9926:be70:743c]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: cd936709-dd68-45dc-432b-08d90ca2aefe
x-ms-traffictypediagnostic: SG2PR04MB2811:|PSBPR04MB4022:
X-Microsoft-Antispam-PRVS: <PSBPR04MB4022C73D12B7ECEF0CF240C2E15D9@PSBPR04MB4022.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 7Zuk72JEUjZKbFhgWigokwjQrO5HC7xEhKO7OBJyu7xyJLP80/CJSh7Y1arEEP3xa+ZZvOaFblkm/+n/3flCQAJL5xEVbJSgpwycLnRyznfN42xaGdjxc0spbLUqgrU1QKa1aA3bEZF/cRbyqow0RoaHAWvRLj4k1nVBDP+MCBV4I1iQlBqsfiSM2krpMLN7ZyAJtzmE33YXP5YKMYNXhQhob30Bd0aMIFZsM1jS30vvi1N32IEZSaYZ+leBB4nBIN1lC1s08ib4Yrhe3J3XyElvStdrjyFILe5Nviz+NP1dcd0y3e4yZYK7I5LGaY5RaWjNdJsQm+YjGcFP2IodywtShxtOOCe8xhDZ1l9SxLmO8E+Ru37TcFDqYPePBPlNtL/shQpTf3jgW9QTPOEZRS7Ka245PKgKqNiKUtm1IXqMcsIHxDVNkdmUXWOpSDVdcRIXFTuTLvbVxqIg+zX2WlgPL2bpK3Qr3UlUuF+VcIsP9PYeLDh6nYAqr1eJvoYP8oXiZ2UibK471R2BucDrtJYoNDeTrlspR/d8L+Fp04C60Q1UKAu3Cs20etz6ItY4xTMv3ifNZgB4U5/s/sjB2os1ghK5qs5Y/Xwk9GbLd0N4TfdeiObO0Z8rFc/NzmCLqgCTC/6JJ18jvPuPFYl86NYtBwcZmpAvwrexmwDtOIg=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:SG2PR04MB3093.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(396003)(376002)(39850400004)(2906002)(122000001)(38100700002)(966005)(45080400002)(71200400001)(478600001)(6916009)(33656002)(8936002)(83380400001)(54906003)(316002)(8676002)(52536014)(5660300002)(55016002)(9686003)(4326008)(86362001)(53546011)(6506007)(66946007)(186003)(66476007)(76116006)(66446008)(66556008)(7696005)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XOODv9QMSAFgJjPuK9tILWoho8uc4vPWb2dnAezXxWBb1UiTOwhqc1drOSOi?=
 =?us-ascii?Q?RmB1775nzQPKTANayOeZQhsuEpD1x2PzAC39HRx/jW2Y/2aJfVIqmqeuXBG2?=
 =?us-ascii?Q?oaeIzwYci6cadZNhXQvXQu0mt7ESOT8daefERCPdwf3WFdm8Z++iLm8EvrOy?=
 =?us-ascii?Q?/g5QBQaw9TCOQ3rAkTESrBWAD84+VnfBHUqhgGZx8S7m1vhzptnOIeb7AEVY?=
 =?us-ascii?Q?sW7p3ARzrXd6+h6sXpsOg5dcf3zRPRaQ8tfH3A6ij0H2Ge22HWbjWvf12u/N?=
 =?us-ascii?Q?wYz9VcqakVBtSqAMA7juQqpX0AzQOvwEKJ+7tU4IypaKnfU7i9nNb+IjBmUL?=
 =?us-ascii?Q?eW2L/88k/dzAM4vw8DU0dBassPKDPZhOShddF63nVDU6dg5g9BEAxtuZsONm?=
 =?us-ascii?Q?CNU9ykrrpl6chTt99CkPpw7oP7YYx0jRkDYs2D6qMgqC28LmixDlTmpVBhOt?=
 =?us-ascii?Q?dov1e4CQs9/Nao6QTO7Lil19Tgk9Mwk4R7rA/GkH0S+sA8ScFB67MulpQttV?=
 =?us-ascii?Q?6qT8TzKZ44dk/LHb/60E2xKo/EGYdImV+kmi9ECWUcZLg2ABuStNXA4tTSP5?=
 =?us-ascii?Q?sKVE8uvgarWD30YtWJUbBAoNMUcoVqwfYjS2Zvzbu2vHq22SKIEoQV0cDpO4?=
 =?us-ascii?Q?5q20NcvyIA/o8icjt0xI43VhwmJCoLq9Ccp05/IRHBfZFYsLRJGrKn2N/3mK?=
 =?us-ascii?Q?3xMGCincj1ohKAvJAC7Kwklg7lp+5ri8gzx8/fSodFFGOMvbya8vDWTxBO7D?=
 =?us-ascii?Q?6EUYENGZnLOQucSGqv/r4rjVX6AKsb0u/FFxMzRFB7AKO5Yg/Lb+Xw6rqxyQ?=
 =?us-ascii?Q?AJjwOSEf35kBZ9dBJpfUoJgVrKA83gTnOf4KBnsQ/5PpGOU9AVY5Y/7PXAzG?=
 =?us-ascii?Q?twtHKvMTLn4Cp1CoUFt0SildKJoEGoGdUQ2OqOr6cFP3irJD26rYPrgXv3Vx?=
 =?us-ascii?Q?6nQKm1hubx1TwkCgyM1nDgWqUW8MKx7SOdL/yK8PIV0UHZdgxL3it6XbHqmb?=
 =?us-ascii?Q?aoKD9JpBSkMS5ONx45zN0DsAyoHTwnoZ2aoergxkEbmpXH1UVSFyO4j13Nk2?=
 =?us-ascii?Q?AIsVJzrZuslx6FKaAE5RgkBh9kRKl0IF40pinzYTY59lZqIq0aJ0kMqWYt70?=
 =?us-ascii?Q?jQnEnObC8nkWADhU3f18ALGWUA3PTeR6udFo29T24xhJ72qq6W8Wa/iyZwKT?=
 =?us-ascii?Q?Vxi9X6goA9GB3HM4i/9EPUrXVnwFm97QJbdErxSo/Z2dEezZiU3P51KKn4t4?=
 =?us-ascii?Q?KkRFiDWKN2Dcrus8WY+sZJ4+EqYbqiktjuNflsiDc2uPpVaJGYnzrnhdAaBZ?=
 =?us-ascii?Q?tdaSYUNX/We8PS4bSpoFdkZC4Gd18HFtIp9F343modJimUof/Nemhf8/iDc1?=
 =?us-ascii?Q?TMPnCc62dPbYf+7DQ0p2Ly1+e0xM?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB2811
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6c8ce4b1-4516-49db-d23f-08d90ca2ac82
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rMv0GlD/c4ACLuTFqPhNvHexD2GpW/1xPniiEL8eYwbfoK7OwyLTw0F/0MFIpC31eCCgfEKiILx7Ot12K0sOymRGuSipi/k/aitFrFJ09NydI4aOttBnafnLJTZh2tpuxjS3sb/iesewQKtUAPAlcw69rPiHW5y5lsoSHoXZ1iUjKowEZHZhU1nRwJ1LKlt0QbR2L4Cg1B1e+f3d/jpLsDYHQfVA0O06L+L0dsWppXjC5Znn3R6wSIfjkNZYRGJCYM3yye/WggD/Pw0aOtEzrQ6hiAWRDH6L8jWV8UGY8e/CPet7964xrjh2H45vfQoVB7BxOgn5tAQIULjiPdZ5Vop1UIEJDxC5gIdrpkoKpCSH67uAPcYBDZkq4mlW+sQo1aEUV72R2xThwD/wTLUXElA6h7KuMsiRhz6TxhXYjPJvx6WrY3xSKCGgF/m6x08NH1F8YeIOljE5qYlbJc4RVQ6GICbPAQa9ca4ItrDGBuzGa6x+4HMxf3IW2YPKP2uGReGAZSqNjcaWJYknktA75ikuIbbZ6OwrUosxhguJaibhFlDFK2cFiu6ZV693vGd5sIr6aE3EcxuCDYrhWmYR910lKrADqfhtqot8wGjEQyMZwWuHwwzjJK/HZaS3q5rdpnMWKGWN0HNfqwGsjHNegZQDKgqPOXgWiB7chVqPupf8HcFGP2ma4nHsTBB8n3AtbQAD678BvfXItVX8ShJbtYQplCSV8+WErYTrTHYbRK+TwBB5//PG/ivUXyaijUNWrghMkJzzRi/db4ym4EB/hs/hosCBWpk6NgkEOUM9ZAs=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-HK2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39850400004)(136003)(396003)(46966006)(36840700001)(186003)(316002)(36906005)(26005)(966005)(478600001)(36860700001)(45080400002)(7696005)(47076005)(52536014)(5660300002)(6506007)(336012)(54906003)(70586007)(55016002)(86362001)(83380400001)(33656002)(70206006)(356005)(81166007)(2906002)(82310400003)(34020700004)(53546011)(4326008)(6916009)(8676002)(9686003)(8936002)(82740400003)(36900700001);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 13:11:50.1133 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd936709-dd68-45dc-432b-08d90ca2aefe
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[APC01-HK2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT055.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSBPR04MB4022
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

Thanks Ed, I applied this patch and tested. It is working.

On Fri, Apr 30, 2021 at 7:26 AM Jayashree D <jayashree-d@hcl.com> wrote:
>
> Thanks Patrick, I will follow this issue in that sdbusplus.
>
> -----Original Message-----
> From: Patrick Williams <patrick@stwcx.xyz>
> Sent: Friday, April 30, 2021 7:40 PM
> To: Jayashree D <jayashree-d@hcl.com>
> Cc: openbmc@lists.ozlabs.org
> Subject: Re: Issue in displaying hardware name using Redfish
>
> On Fri, Apr 30, 2021 at 07:14:19AM +0000, Jayashree D wrote:
> > I am using Redfish commands to verify the details of sensor and hardwar=
e.
> > But I am getting the hardware name as "TiogaPass\ufffdseboard" instead =
of "TiogaPass_Baseboard".
>
> There is a github issue open tracking this and Ed is working on it.

The fix is here;  I believe it's just waiting on the maintainer;

https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgerrit.=
openbmc-project.xyz%2Fc%2Fopenbmc%2Fsdbusplus%2F%2B%2F42512&amp;data=3D04%7=
C01%7Cjayashree-d%40hcl.com%7Cb15f8a5d284a4fa15fe008d90bec07a3%7C189de737c9=
3a4f5a8b686f4ca9941912%7C0%7C0%7C637553930635583961%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dd1%2ButSTENq17zpBhgSi2BvaxbXWoesFBb%2FV9LFSVWyI%3D&amp;reserved=
=3D0

>
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithu=
b.com%2Fopenbmc%2Fsdbusplus%2Fissues%2F60&amp;data=3D04%7C01%7Cjayashree-d%=
40hcl.com%7Cb15f8a5d284a4fa15fe008d90bec07a3%7C189de737c93a4f5a8b686f4ca994=
1912%7C0%7C0%7C637553930635593956%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM=
DAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DHMbqmL=
gMvzvF9sbyv49lLhm6WVF7B8n9bYFG2aEjF8c%3D&amp;reserved=3D0
>
> --
> Patrick Williams
> ::DISCLAIMER::
> ________________________________
> The contents of this e-mail and any attachment(s) are confidential and in=
tended for the named recipient(s) only. E-mail transmission is not guarante=
ed to be secure or error-free as information could be intercepted, corrupte=
d, lost, destroyed, arrive late or incomplete, or may contain viruses in tr=
ansmission. The e mail and its contents (with or without referred errors) s=
hall therefore not attach any liability on the originator or HCL or its aff=
iliates. Views or opinions, if any, presented in this email are solely thos=
e of the author and may not necessarily reflect the views or opinions of HC=
L or its affiliates. Any form of reproduction, dissemination, copying, disc=
losure, modification, distribution and / or publication of this message wit=
hout the prior written consent of authorized representative of HCL is stric=
tly prohibited. If you have received this email in error please delete it a=
nd notify the sender immediately. Before opening any email and/or attachmen=
ts, please check them for viruses and other defects.
> ________________________________
