Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9034849762D
	for <lists+openbmc@lfdr.de>; Sun, 23 Jan 2022 23:54:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JhpMD3kfsz30RQ
	for <lists+openbmc@lfdr.de>; Mon, 24 Jan 2022 09:54:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.a=rsa-sha256 header.s=selector2 header.b=mZ0IFmwZ;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.236.130;
 helo=nam11-bn8-obe.outbound.protection.outlook.com;
 envelope-from=tungnguyen@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com
 header.a=rsa-sha256 header.s=selector2 header.b=mZ0IFmwZ; 
 dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2130.outbound.protection.outlook.com [40.107.236.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jg5fL1Zhbz30MT
 for <openbmc@lists.ozlabs.org>; Fri, 21 Jan 2022 15:16:07 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3Xq/L9cOREIkGrpj/SxZwf73qOliOrY0Dnsyq/+rCAiqgLVvY1FTJ9P/iW4DB1EzzlvzgF4JCaxGP25wUO2ww9BkrpNxXl78HABmMDgmnl8AQqUOlk7gW4FgzCU3ZD+52RG8whPE63zxUREiEZzFltBeTyyhEIcRyjUW7oCFMw+3NaHnDYe7de+UtH0hZA4nPAR1YX6syb9isdfqCGOKYveuOtbGpCsZFiCX5dcf+WFk4j4iLMeq1tXxAQioCWc/RfzePn0uTW1sLRkXAGpjWKsitLwVepk3p7Oe8uVQfVUL8rwXNpeU6XbJqA8YHkjQHk/iLodyu2ql8hCHuTZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H0ck8kXznRY3sSlpYik+0XqK0S5iDoEa4AH1SDoNRnk=;
 b=bm+0ds9uDQXjfwRtGpkr++oreDC/uTz99HrhqkwsfYsXayUyb0V2YU7iwR+nD1pZxW55A3nA1phM91GLotdgRaNQT39oN0PB4yk9dEOOVO0kx+FNg3fjEQ/WQrMu/g1bP5lOtWUReR8Xyd9FEoW5epjt9JE9LB53+3ekGTEAmRBDFSf2L4vdCNcN4bQB1CTkF4qPQp3e3TcH2AwSQPdtSKJlG8PgBUL/4nEFRIIk5nw0bUHrcaU9sPdKmFlH4XiLcNwlhFNp02BTeVQFQ3Y0Z3d7XegZqWD5hqE9xBK5g/7iS5OQv0FzLZUbAR1zdqF0TfImNbQW09KHjD913OEASg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H0ck8kXznRY3sSlpYik+0XqK0S5iDoEa4AH1SDoNRnk=;
 b=mZ0IFmwZAfdAFl5GZQ5Wn8Yj2ZyoiSAfyEsopiAFBihCiIxjE33hDIzYEXzibmMl2wvE58y6+MUtn+qtWmB4AP0iFnUv1NaTvwyp22Tg/JgMKNVrB0RuGReLkMFG7rH0uP6k13HFOdlWWrOfhcb+/+aAzOtrauzxFV5YhnzwykQ=
Received: from BL0PR01MB5156.prod.exchangelabs.com (2603:10b6:208:67::13) by
 MN2PR01MB5629.prod.exchangelabs.com (2603:10b6:208:117::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.8; Fri, 21 Jan 2022 04:15:46 +0000
Received: from BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::4c74:e515:b548:1486]) by BL0PR01MB5156.prod.exchangelabs.com
 ([fe80::4c74:e515:b548:1486%4]) with mapi id 15.20.4888.014; Fri, 21 Jan 2022
 04:15:46 +0000
From: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: Re: MCTP/PLDM BMC-host communication design
Thread-Topic: MCTP/PLDM BMC-host communication design
Thread-Index: AQHYC73kfl3LazavgkaXDWxfXPa3z6xrGKsAgAHB8eI=
Date: Fri, 21 Jan 2022 04:15:46 +0000
Message-ID: <BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9@BL0PR01MB5156.prod.exchangelabs.com>
References: <BL0PR01MB5156352A9E00E59F5F9641E4FF579@BL0PR01MB5156.prod.exchangelabs.com>
 <3f884ee81d2bfacf4a112369b79e7e5d367ad774.camel@codeconstruct.com.au>
In-Reply-To: <3f884ee81d2bfacf4a112369b79e7e5d367ad774.camel@codeconstruct.com.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 90870085-6444-4a12-ec7d-53d2a1f88451
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 757e35c4-d12e-40fd-66df-08d9dc94b307
x-ms-traffictypediagnostic: MN2PR01MB5629:EE_
x-microsoft-antispam-prvs: <MN2PR01MB5629D9FB4A850438E8C4F124FF5B9@MN2PR01MB5629.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5fzrNPakorcLxFPPdUJ/P6YLcdzYpAA5gn0RuFnNPkGUm/Wywes5fT1Lah2Ed2NGeeBqlW4QGa69wYTSHzTdYL1RthHf4Xrlp1VWtthUWqleZOW80qEbUvb2bJPFfgHAwcNz+HhlQRvfLx1kv91AFmq1rD1vyXTRD1+6m3FoWONoFoNxteCYD5luy8FBL6asX3EqgUKPcXUX4SWyIKDYj/teKGAJsOOFWUUqajECmnCiE6bgKVubHjIB/7TJbCLP4hNu0TxBBtMP34uQEI2edTrzNVzg8w6L+ExOzal/M9O0BVvf27+PK97mvmI2JVxyPtInN/KbJKhMjNWxMCggd1ObTLW0GrJt/C6YWtq0DnvF9C8tSTRMytVo3Z/hG9zyof9l9m0k2A2qcS7aMG/8Mptd/yWqOdm5KIwphRCVW/nxLkbDZItHY2TLCnX3uT4yfvjbsIwdzQ7cdm82Ur60dBsiFVQF+IyBRduifLcN1aLrtpG7DpPj192FZC8IX1/dr3OHNLuPdHjrwQ0QA4zSnZHscZSaCu4gBQezw7qLhmPSqHLGOiF8YSfimXRPbxJulOIE4QCUS3gFVYvBa0XFFVEEXkrlBjiy8lXaEzz7osY+8+B67jmaL5amwdlYbOldImCVAt+/Gs4DQpTCP6LTlqr3n1GfyFZ6JDRakrYSef64BgZC6AN6J18FxNn/yuUwTNPCc1rff5bweLmPl5j5GScuWdtQEBA4MtAwOCCNbhDtPu4T/51HwxK7j1TicdKxm5fMvbbsto2qWDG0YyuF49OiDHxEe+qQ4wSqUehqbZ6Y2dfSOemqGWhk4FZqX0VP1pvZngS9zs8HoU0BKy79Cw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR01MB5156.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52536014)(66556008)(66476007)(166002)(66946007)(26005)(5660300002)(316002)(19627405001)(7696005)(508600001)(71200400001)(64756008)(110136005)(186003)(83380400001)(66446008)(9686003)(33656002)(91956017)(76116006)(4326008)(54906003)(38070700005)(8676002)(38100700002)(3480700007)(107886003)(2906002)(6506007)(53546011)(86362001)(55016003)(122000001)(966005)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cu+f2xS2Ar3iP8WzBL7XugM+yVJWoA/vW826a9VJiUeaX8CWoGZitbsPDwIv?=
 =?us-ascii?Q?v4Rr7B9jz+oezaz7BXaFShVSRCRjmlglC2kZb8wY31G4Y1KD14rx8Oed4NHY?=
 =?us-ascii?Q?cRBv89MAbup6oaY3OnUhEMOORKQB3lTPJwqUJqh23lQxAhOGWCuSXFTHpDsk?=
 =?us-ascii?Q?l+zG8uJqRuTTe/kQSPUpN+0pOi8BTrEi2JbaNIXWIcykRZOq7siknucShjgV?=
 =?us-ascii?Q?IC/9k+g9uMpZ2I4zGhhdxyXzkWmLETqmJlvuueoslgQmkktGmW+oZxAlNasB?=
 =?us-ascii?Q?ZWmRgTjqJkkcT8w1HKQ5pAyXgdzaFsqlzrCDJ9UkQr3PXHsaFaxVu3aaRpR2?=
 =?us-ascii?Q?9Cbby/d6/DYnLzL9lcePa4c1xvGUISwHCabPfVPP2Xn04MVFUk+1Rhao6Iqo?=
 =?us-ascii?Q?3C5N/M+NtupPB+6H5H6EohfvCuNA21Q3xhbX8gzpUnAauw9F0FNyCgV2Ew82?=
 =?us-ascii?Q?0e7hocbzCeV2CsayLZrWhVuqXiOI4FFqZD0NIE9eBqf9ufBwcfC7qSA6yLQZ?=
 =?us-ascii?Q?ZuGflatos7E9l9JbBsoRSWZr49Oy7X5oM5fT/bagJM1ARlkXmUT9qdJ6vpVb?=
 =?us-ascii?Q?YDVYwYxKvHOS/miZcdbUkVa3LWocxwh7Ufz0C4oZpcanOjZmHhbiak9Xr68e?=
 =?us-ascii?Q?EGzIikw3CGju7rAoLv0pZeBYZnCNvEmc1eEcWr0qPOGBZXPs/YHwn5QlRfSO?=
 =?us-ascii?Q?+K34/ZShPfPBxJzgaAEMs3MlxvdnRTVJr0Y1rBXyVS9oB1XCOFz7wftA9TBb?=
 =?us-ascii?Q?jxk/ONzZBuvOl93bx/QsIjBk4+YiNZ0blhsXUWDQzSal1cSsMePkiltckH4s?=
 =?us-ascii?Q?8Hmwmr30T46nN/TWjH2GC0a0ryedWS6+gm9pZx3W+UkLjR7IXsSeVQoV+DsG?=
 =?us-ascii?Q?Og8jtiCLHaqg1ulpY2bdUoamRGxcOo0uHlWXrDfC7AQ6A84MO/mDH2GJRRg7?=
 =?us-ascii?Q?4GcHTOUdeNI7FEiMhTLm4S24mHiAWr9pFB/V3p6kSCZLjex5NwaIavQYVulf?=
 =?us-ascii?Q?LDz2wv6bLNDj9fpEgkJXujYpKzW+WRWed8T+TBAf91iITzC/3LivY/uSilV7?=
 =?us-ascii?Q?DfVDYbcVc05fXIO2egXOD0oE0pM96fnaYnXCjP2159zF0V7w6w5Z0PFd22b/?=
 =?us-ascii?Q?v3UfzCIiq3IIKZ4uzQeinv26X394GpphJ4eKYJzqpOmvkOCl+EouHNTe+zWK?=
 =?us-ascii?Q?2MISAbdAr5pPZh6DsHDOotE5Rm+GbGBjQ3362YmP3F+y3rRUtM6ZJ+ck1B5J?=
 =?us-ascii?Q?uGEFzPQjcBicXk6qENsfinIgzaKf5Gpw9ffRFGfZHWBRxVNMG+i9PYXsf1oV?=
 =?us-ascii?Q?NRrxuQzzpSyJlOorQd4G0984pmFu1AIEjVLyn1d/OpXmm/3d4PcHSMxP4Cjv?=
 =?us-ascii?Q?zlHlMBJpYXho8oru8wGCsGpFl0HroXxgSDYquTKHqmQ9WjCdRjOYcPG6KVLM?=
 =?us-ascii?Q?SezPy4GdwgufBDbOCfiUh+p0hPBWjT1Ena95GZW5XR+4Coq8EQcBwBXeAgLK?=
 =?us-ascii?Q?V4Jj1B9O78WxKL2CZbkXFurScfGrZ+iV8iNJRH+MTRXMtZT2pqIvFfVpJlzD?=
 =?us-ascii?Q?+IzUq/XRTLJmgvh8aTCXNJaiZEqXCNypzkvI8vZy//FTsykChSHlZMli7IX9?=
 =?us-ascii?Q?H4SiTEsvwc9PjLhHT/uKG20TBmFX8bafiN+En4H+oGpEaXyMah399zSGckdF?=
 =?us-ascii?Q?boLD4GPkWbSkY5QKl6ao3e/YaFAodPebm0xgAyDHAILT6meW?=
Content-Type: multipart/alternative;
 boundary="_000_BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9BL0PR01MB5156prod_"
MIME-Version: 1.0
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR01MB5156.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757e35c4-d12e-40fd-66df-08d9dc94b307
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2022 04:15:46.5106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SX0CYTj2WZ8aOZLNo5QiXBblwCcHfiYTaoUTL69RhrLy2jMEc0Cl5BTSMsWVo7g05eYTchQpiCnq5n8es6NPSporwqwsyMs8p+9ZslqNjJuALtKS3fdLgKiDPyDAvHLk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR01MB5629
X-Mailman-Approved-At: Mon, 24 Jan 2022 09:53:37 +1100
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
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>,
 Thang Nguyen OS <thang@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9BL0PR01MB5156prod_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear Jeremy, Andrew,
Appreciated of your comments. We are using the userspace MCTP and will cons=
ider moving to kernel space MCTP as the suggestion.
Because of the specific requirements, we look forward for simpler way. In o=
ur case, we have on-chip sensors and events which are allocated in both 2 s=
ockets, and the situation is: we must send the PLDM command to poll the dat=
a.  If using 2 interfaces to communicate with host, I think it would be com=
plex when sending to multiple sockets.
The things should be considered as :
+ If a socket is problem during runtime, is the process of MCTPL/PLDM still=
 ok
+ If one, or more socket problem. Can we reboot the whole system to recover=
 ?

When using 1 interface, i think:
+ From the host side, socket 0 (master) should manage its other sockets, (m=
ight be not via SMBus, but other faster sockets communication). Of course, =
the more work should be implemented in the firmware, and you have pointed.
+ BMC just recover the system (via reboot) when socket 0 issue, otherwise i=
t does properly

Do you think any more issues with the communication performance ?

Thanks,

________________________________
From: Jeremy Kerr <jk@codeconstruct.com.au>
Sent: Thursday, January 20, 2022 7:53 AM
To: Tung Nguyen OS <tungnguyen@os.amperecomputing.com>; openbmc@lists.ozlab=
s.org <openbmc@lists.ozlabs.org>
Cc: Thu Nguyen OS <thu@os.amperecomputing.com>; Thang Nguyen OS <thang@os.a=
mperecomputing.com>
Subject: Re: MCTP/PLDM BMC-host communication design

Hi Tung,

> We are using community PLDM/MCTP code to design our MCTP/PLDM stack
> via SMBUS on aarch64 system. Basically, we have 2 CPU sockets
> corresponding with 2 SMBUS addresses, and the MCTP/PLDM stack looks
> like this image:
>
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd393=
03bbb6e9c8a6f646/current_design.png

That looks good to me, but a couple of notes:

 - EID 0 and EID 1 are reserved addresses according to the spec, the
   usable range starts at 8

 - therefore, the *convention* so far for EID allocation is to assign
   EID 8 to the BMC, as the top-level bus owner, and allocate onwards
   from there. However, that's certainly not fixed if you require
   something different for your design.

 - you don't necessarily need two EIDs (0 and 1) for the BMC there.
   Even if there are two interfaces, you can use a single EID on the
   BMC, which simplifies things.

> Due to the not supported of discovery process, we are fixing the EIDs
> for host.

As Andrew has mentioned, we have the in-kernel stack working, including
the EID discovery process using MCTP Control Protocol messaging.

If you'd like to experiment with this, we have a couple of backport
branches for 5.10 and 5.15 kernels, depending on which you're working
with:

 https://codeconstruct.com.au/docs/mctp-on-linux-introduction/#our-developm=
ent-branches

It's still possible to use fixed EID(s) for remote endpoints though, if
your host MCTP stack does not support the control protocol. You'll just
need to set up (on the BMC) some static routes for the fixed remote
EIDs. I'm happy to help out with configuring that if you like.

> A new way that is considering is like the image:
> https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd393=
03bbb6e9c8a6f646/new_design.png

That looks like it has some considerable drawbacks though, being:

 - you'll now need to implement MCTP bridging between the SMBus link
   (between host and socket 0) and whatever interface you're using to
   communicate between socket 0 and socket 1. This may then require you
   to implement more of the control protocol stack on the host (for
   example, as you'll need to allocate EID pools from the top-level bus
   owner, if you're doing dynamic addressing).

   That's all still possible, but requires more firmware you'll need to
   implement

 - if there's an issue with the socket 0's link, (say, if the host
   has offlined offlined CPUs in socket 0), you might lose MCTP
   connectivity between the BMC and socket 1 too.

That said, it's still feasible, but I'd suggest your first design as a
simpler and more reliable solution.

Regards,


Jeremy


--_000_BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9BL0PR01MB5156prod_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Dear Jeremy, Andrew,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Appreciated of your comments. W<span style=3D"color: rgb(0, 0, 0); font-fam=
ily: Calibri, Arial, Helvetica, sans-serif; font-size: 12pt;">e are using t=
he
</span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Hel=
vetica, sans-serif; font-size: 12pt;">userspace&nbsp;</span><span style=3D"=
color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; fo=
nt-size: 12pt;">MCTP and will consider moving
 to kernel space MCTP as the suggestion.&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">Because of the specific requirements, we loo=
k forward for simpler way. In our case, we have on-chip sensors and events =
which are allocated in both 2 sockets,
 and the situation is: we must send the PLDM command to poll the data.&nbsp=
;&nbsp;</span><span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Ari=
al, Helvetica, sans-serif; font-size: 12pt;">I</span><span style=3D"color: =
rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt;">f
 using 2 interfaces to communicate with host, I think it would be complex w=
hen sending to multiple sockets.&nbsp;</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<span style=3D"color: rgb(0, 0, 0); font-family: Calibri, Arial, Helvetica,=
 sans-serif; font-size: 12pt;">The things should be considered as :</span><=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
+ If a socket is problem during runtime, is the process of MCTPL/PLDM still=
 ok</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
+ If one, or more socket problem. Can we reboot the whole system to recover=
 ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
When using 1 interface, i think:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
+ From the host side, socket 0 (master) should manage its other sockets, (m=
ight be not via SMBus, but other faster sockets communication). Of course, =
the more work should be implemented in the firmware, and you have pointed.<=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
+ BMC just recover the system (via reboot) when socket 0 issue, otherwise i=
t does properly</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Do you think any more issues with the communication performance ?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Jeremy Kerr &lt;jk@co=
deconstruct.com.au&gt;<br>
<b>Sent:</b> Thursday, January 20, 2022 7:53 AM<br>
<b>To:</b> Tung Nguyen OS &lt;tungnguyen@os.amperecomputing.com&gt;; openbm=
c@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Cc:</b> Thu Nguyen OS &lt;thu@os.amperecomputing.com&gt;; Thang Nguyen O=
S &lt;thang@os.amperecomputing.com&gt;<br>
<b>Subject:</b> Re: MCTP/PLDM BMC-host communication design</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi Tung,<br>
<br>
&gt; We are using community PLDM/MCTP code to design our MCTP/PLDM stack<br=
>
&gt; via SMBUS on aarch64 system. Basically, we have 2 CPU sockets<br>
&gt; corresponding with 2 SMBUS addresses, and the MCTP/PLDM stack looks<br=
>
&gt; like this image:<br>
&gt;&nbsp; <br>
&gt; <a href=3D"https://github.com/tungnguyen-ampere/images/blob/7dba355b47=
42d0ffab9cd39303bbb6e9c8a6f646/current_design.png">
https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd39303=
bbb6e9c8a6f646/current_design.png</a><br>
<br>
That looks good to me, but a couple of notes:<br>
<br>
&nbsp;- EID 0 and EID 1 are reserved addresses according to the spec, the<b=
r>
&nbsp;&nbsp; usable range starts at 8<br>
<br>
&nbsp;- therefore, the *convention* so far for EID allocation is to assign<=
br>
&nbsp;&nbsp; EID 8 to the BMC, as the top-level bus owner, and allocate onw=
ards<br>
&nbsp;&nbsp; from there. However, that's certainly not fixed if you require=
<br>
&nbsp;&nbsp; something different for your design.<br>
<br>
&nbsp;- you don't necessarily need two EIDs (0 and 1) for the BMC there.<br=
>
&nbsp;&nbsp; Even if there are two interfaces, you can use a single EID on =
the<br>
&nbsp;&nbsp; BMC, which simplifies things.<br>
<br>
&gt; Due to the not supported of discovery process, we are fixing the EIDs<=
br>
&gt; for host.<br>
<br>
As Andrew has mentioned, we have the in-kernel stack working, including<br>
the EID discovery process using MCTP Control Protocol messaging.<br>
<br>
If you'd like to experiment with this, we have a couple of backport<br>
branches for 5.10 and 5.15 kernels, depending on which you're working<br>
with:<br>
<br>
&nbsp;<a href=3D"https://codeconstruct.com.au/docs/mctp-on-linux-introducti=
on/#our-development-branches">https://codeconstruct.com.au/docs/mctp-on-lin=
ux-introduction/#our-development-branches</a><br>
<br>
It's still possible to use fixed EID(s) for remote endpoints though, if<br>
your host MCTP stack does not support the control protocol. You'll just<br>
need to set up (on the BMC) some static routes for the fixed remote<br>
EIDs. I'm happy to help out with configuring that if you like.<br>
<br>
&gt; A new way that is considering is like the image:&nbsp; <br>
&gt; <a href=3D"https://github.com/tungnguyen-ampere/images/blob/7dba355b47=
42d0ffab9cd39303bbb6e9c8a6f646/new_design.png">
https://github.com/tungnguyen-ampere/images/blob/7dba355b4742d0ffab9cd39303=
bbb6e9c8a6f646/new_design.png</a><br>
<br>
That looks like it has some considerable drawbacks though, being:<br>
<br>
&nbsp;- you'll now need to implement MCTP bridging between the SMBus link<b=
r>
&nbsp;&nbsp; (between host and socket 0) and whatever interface you're usin=
g to<br>
&nbsp;&nbsp; communicate between socket 0 and socket 1. This may then requi=
re you<br>
&nbsp;&nbsp; to implement more of the control protocol stack on the host (f=
or<br>
&nbsp;&nbsp; example, as you'll need to allocate EID pools from the top-lev=
el bus<br>
&nbsp;&nbsp; owner, if you're doing dynamic addressing).<br>
<br>
&nbsp;&nbsp; That's all still possible, but requires more firmware you'll n=
eed to<br>
&nbsp;&nbsp; implement<br>
<br>
&nbsp;- if there's an issue with the socket 0's link, (say, if the host<br>
&nbsp;&nbsp; has offlined offlined CPUs in socket 0), you might lose MCTP<b=
r>
&nbsp;&nbsp; connectivity between the BMC and socket 1 too.<br>
<br>
That said, it's still feasible, but I'd suggest your first design as a<br>
simpler and more reliable solution.<br>
<br>
Regards,<br>
<br>
<br>
Jeremy<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BL0PR01MB515649ABC90BE4CCC465B8B9FF5B9BL0PR01MB5156prod_--
