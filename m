Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D06EEC6B
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 04:35:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5jdL64nRz3cd2
	for <lists+openbmc@lfdr.de>; Wed, 26 Apr 2023 12:35:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=NwudVLt3;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amperemail.onmicrosoft.com (client-ip=2a01:111:f400:fe5a::714; helo=nam12-mw2-obe.outbound.protection.outlook.com; envelope-from=hieuh@amperemail.onmicrosoft.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=NwudVLt3;
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on20714.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe5a::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5jcn0FZzz30QD
	for <openbmc@lists.ozlabs.org>; Wed, 26 Apr 2023 12:34:31 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HJEjIpAyPS5lRHSloK+Cgj1KWYmJ090zCOn7Q612QNXgfMowzl+moDEtmRe8PWlXgtHteU0Y2awzgBXHoeH/pngA8ByGOOHi6RY6icUztYUsg64LpKUZ6oCr/SUw55vcx+iVkITK8NyYTe0m8bQDnFMROfU6bf40EiJRO3fvpmVo1kH1RmDtzzez1Iqs91msXrauyz35/L8txbqDkMVZ0ZECl7UNJRjHPDhxHCc6MWuNJEwkmBjeC2vN2l5aFSRsaDwTJR8RcKVbndi9ZWpkyAO2FgLluEcixvv0ptSUCyTTWRu83ZVuDKX9sxYCetAlhMUCxJrqm1t38gJvdasXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lrqXeIevLkQbpKVvqmAjVOkZ5ihc+/eM2yH44z/y+hQ=;
 b=a0WFrXxCZsoERpW55MnNQPqx/fmGYh/a4sCEnSLK/7UBoCioFNhJN/G5nEvYQ7HeBHO/MP6v7QRvGlO/0ax1RKSvGdgo1NpRYMA/qzCRaGY1sJnim19EmWIM07fMUfo9Q8zk3482ZONST/aZE5BgOVYugWEsQKOU/VTqvBxnch/n4E69klttLyTWtLE3e4fygkCWVF+GwFnSV0bmtrPGtMkbxWl7mM7AOG3RPMSh6qushoUEErmbewRiCb6i7Y8ceexmgUS5dfkiodrl0FHrXHDESiYcEJQDWyBVY6lpzwxP1q5J58LwG40hgMdKjZDnJaaYsCrfd9oiQYH+BgateA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amperemail.onmicrosoft.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lrqXeIevLkQbpKVvqmAjVOkZ5ihc+/eM2yH44z/y+hQ=;
 b=NwudVLt3ZsTwfc+jLh3BFdUZi4LUZyYliY7fXy59DxX29cCVyh3viGD7SNw/7Eg5+WEJPmzsRmHDry62MPkjL1ag0Ni8H/qw2WakQefgeOlhiHPChQyWAkzsa2p1N1md1s8lKszGO1x2Nv6FZzJAbJEtc0+f9OYYvc6AJaI0ULA=
Received: from DM4PR01MB7836.prod.exchangelabs.com (2603:10b6:8:6c::9) by
 SN6PR01MB4543.prod.exchangelabs.com (2603:10b6:805:eb::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6340.19; Wed, 26 Apr 2023 02:34:10 +0000
Received: from DM4PR01MB7836.prod.exchangelabs.com
 ([fe80::a0a5:8f58:e78b:8997]) by DM4PR01MB7836.prod.exchangelabs.com
 ([fe80::a0a5:8f58:e78b:8997%4]) with mapi id 15.20.6340.019; Wed, 26 Apr 2023
 02:34:09 +0000
From: Hieu Huynh OS <hieuh@amperemail.onmicrosoft.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Restrict account only works on a dedicated network interface
Thread-Topic: Restrict account only works on a dedicated network interface
Thread-Index: AQHZd+eU1vfR/xmiv0+uiNIovUvj2A==
Date: Wed, 26 Apr 2023 02:34:09 +0000
Message-ID: <DC643F45-5229-46F8-8233-E4116ECF4E2A@amperemail.onmicrosoft.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR01MB7836:EE_|SN6PR01MB4543:EE_
x-ms-office365-filtering-correlation-id: c8f02177-265e-49c8-d560-08db45feb6da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Xaj8Xw5kkddr9uds8HwveOeUxWeDexh0vDKXiDxzVJM3aArN1O7X38qhg2Y0t24kQfNZqIV4bcnLqjywFjuxfq7eseV9kSeWcosgJ7Zr95MQP4t4Ghm7MUD6NKF3qV/Y64k0MxGr6f4Avbszek9nzdqLj3ashohRf5qpHl/NnflMnD9a6UK86tR6c7jECxlnlUNPSxwjbJieXchzS8aLackcBRAbX11Dfz9fb8iWXrrdf6juoqAoz7RKeeB+mDn4q4cBGN+L3TFSx3AXm4dcedYpqumBjZPjSR9R+BkHFLThIZCtET9K44REjbbDqefVr5Rxsnfh0XNS38nHp4s8h5IcO9WcTsVVy+NSBAoBAFZT+i53unApAjyJVlL0QW9dJ1pj5dOkuYEiLaxl89P9pfA1ZRTYxqkUhBEIQbI/pyQcE2ws7yqfdTczi7VTcTFe59y5hBvgY8svHJBg8Gloct+nCyYJ2Gkj0UOZ9Sn4MzCkxud7SmOuXush0B9UEm2qKDnV+4x9s9XRnxcmcg6VYdVlTLeGhs6eqCTWSTSMPnRAvU4qHpRkezWjsuao70CGzhaG4RUYvDsO2DRDQwslvcpdhArVVwZiTsyAMlOlp0X1rbZRz8j/8iBg6Vb9Nf5s
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR01MB7836.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39850400004)(346002)(376002)(396003)(366004)(451199021)(38070700005)(478600001)(91956017)(4326008)(66476007)(316002)(76116006)(64756008)(66446008)(66946007)(122000001)(6916009)(66556008)(41300700001)(2906002)(8936002)(8676002)(15650500001)(5660300002)(38100700002)(2616005)(6512007)(26005)(55236004)(6506007)(86362001)(186003)(33656002)(558084003)(107886003)(83380400001)(71200400001)(6486002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?9DFRv97YJjoiEkuJEiiVqpbZAwi6lFA/CsmxO81XpflRa0v0Rn7mLL1HJ0SF?=
 =?us-ascii?Q?BaFlz10Sur3CxJMsDSm0MAoZm8EGS/01PJqRkiqMij1XIh8CaR/jeFLUP6+Z?=
 =?us-ascii?Q?3UXY6F8c8MwPhBvOt0NXplKrUypxStQhnhfGnXuV8LigeL5NNpXFy8HhBCQC?=
 =?us-ascii?Q?O+SwAdZ4/IaokmKvIe7xaKCjtkuWUxeJ+C/U3yguY93C0wAp48CLcO1u3BUD?=
 =?us-ascii?Q?4UtYavywOYMWrplPn8MrUkGafJKd2YUNQe/7PvX8GG4USSxAUAY62u2n9P3K?=
 =?us-ascii?Q?Wbo0rJM/NFKf3y0kZOSEnXPpLj2gZWdH+r/OxIJb5h7joAnUR+VtAwFM5qjq?=
 =?us-ascii?Q?9rQUzrXGtP3btexN/8wTVs1ZDYHtbO/DFkkZVbwM3w9csH4YZaNK5Zf0wlfv?=
 =?us-ascii?Q?TNlZ19S7oDTThjjuGb7kpYNcNz8n1zvSYI65TTgIWglW3awo4gEJEG5Yk5L5?=
 =?us-ascii?Q?PJ7+8Sl671gytgbfG4Nb0lhCJQ0T0O2zEsok+O2mlyCIKP6AGQKRy6xlhU/e?=
 =?us-ascii?Q?1Kvq/2AmHYD9ReIkr9Sw9bI3Kl5jbJFUteFLfOpF3bGjXeIjbovNkqWLkw+H?=
 =?us-ascii?Q?qrLwgUaxf9tJuozaOho7fgfWUzsT2iipyp1KaVCSqeCTEc3ZbdFmUb1DP1EY?=
 =?us-ascii?Q?MnP3CPZybKxp57M889YCsObT9T+CfOVKuLYoJz8lTw44UKUYUpRjlFEkxcNP?=
 =?us-ascii?Q?zKc3X8mTSUfJiOzGDB78YzMrsL4xxvEtItmYQk2Y0aqPGHPSUV8vrPQSm9kp?=
 =?us-ascii?Q?DTAp9bP0aXfahUw96+EpZuo6bKNlVVYm+0E2sgH5I33KoqXi3poRbnQ/BuL9?=
 =?us-ascii?Q?BLOtmwQIWJc7TEOSZduoF1cuNhUhOnRkjigUGbY7xTIbxfQgwQsbs+Wis5U2?=
 =?us-ascii?Q?pfMiJDLuD/pRSb646ex+Zc5T239gVgtu0i+BELZF6+hiS3qMHxeoPgSnBuID?=
 =?us-ascii?Q?bjfAkQ+ParPNUc0OdBRg5VP1TKQHp/KQCHSUWAMpM7fFVmMPcH7Jbow54zxw?=
 =?us-ascii?Q?zNOe48LiJoe2F1nKuJe3IvVxih2f0L4ZmmTLv43LsF6J+qekWX3zWMtgHWqH?=
 =?us-ascii?Q?BSTXXZ6FOOQ818Up7UuofyG1d4dFotbfcinkkspM9jxqMgMJkRZp41MXFBPr?=
 =?us-ascii?Q?NzdP6ZFtDYJmcQLxZShZcF1JRUWx2kP9G3EkRWxMU0ej3dKKBL/LfTx2LjXZ?=
 =?us-ascii?Q?+s1qLl7MknSZuNjGm2UO2TZNe6cmbY9k8vGgLmUu7SBjFWayk6iRlZbxgjba?=
 =?us-ascii?Q?rYZ+q0h+evonbognXWZIaXL4XewdcIP30ooR3ZXSNQrX5XviEvdkmDOmS8Q+?=
 =?us-ascii?Q?06iZ5S7SSx0aEuQRG8KN+LUEfyzH0veCGCOsKFiOYv6PYuTrsUN8vGmcxFyj?=
 =?us-ascii?Q?W3NYyodSNK6/xngEEM/5fSwGoulXOHnpgybhBDgteixrIvlSYXV3Btxo5jRM?=
 =?us-ascii?Q?aOGPMzCHqxl+HeORab5h1i6pJ3VnpPiZ91kj/tVd+lkGH4oGkk1S0Fnf1vcO?=
 =?us-ascii?Q?CZbZVK1cfBSDFo3m9S/9FcZCBVLOXx6vSrJ93fPItuaJcdWbcxeckyj2V2mX?=
 =?us-ascii?Q?UWVS0lLgyJkZUq9yMReF8E869/XPg+wKoDvpEwUqQ5deDHlGTSaX/5bBNF3I?=
 =?us-ascii?Q?ZKlqD+8nUT1X16rJgyKHmFc=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DC643F45522946F88233E4116ECF4E2Aamperemailonmicrosoftco_"
MIME-Version: 1.0
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR01MB7836.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f02177-265e-49c8-d560-08db45feb6da
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 02:34:09.4358
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mDkCes5H2k8cXDGsZCtpjMz5R2G5z1nElh+yVu9Yg+muqAK1Jwgjng7ZJ2pDdLZ7RX4j0whCmTirEK+9VNsKpdnmTKe9fFIFWY5t6Qd5yHFO+nZ1xgwQ3/3L4xA5oMFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR01MB4543
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
Cc: Thang Nguyen OS <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_DC643F45522946F88233E4116ECF4E2Aamperemailonmicrosoftco_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

How to restrict 1 account only works on 1 dedicated network interface? I in=
tended to create an account that only works with Redfish in-band.

Thanks!

---
Best Regards,
Hieu Huynh




--_000_DC643F45522946F88233E4116ECF4E2Aamperemailonmicrosoftco_
Content-Type: text/html; charset="us-ascii"
Content-ID: <CA1EBF7A046BAA408B9968045001D5DF@prod.exchangelabs.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;">
<div>Hi,</div>
<div><br>
</div>
<div>How to restrict 1 account only works on 1 dedicated network interface?=
 I intended to create an account that only works with Redfish in-band.</div=
>
<div><br>
</div>
<div>Thanks!</div>
<div><br>
</div>
<div>
<div>---</div>
<div>Best Regards,</div>
<div>Hieu Huynh</div>
<div><br>
</div>
<br class=3D"Apple-interchange-newline">
</div>
<br>
</body>
</html>

--_000_DC643F45522946F88233E4116ECF4E2Aamperemailonmicrosoftco_--
