Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AB01D161E
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 15:43:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MbVb5wzRzDqlS
	for <lists+openbmc@lfdr.de>; Wed, 13 May 2020 23:43:51 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.120; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=QK9Z3O6R; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=QK9Z3O6R; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320120.outbound.protection.outlook.com [40.107.132.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MRbZ1L0CzDqbk
 for <openbmc@lists.ozlabs.org>; Wed, 13 May 2020 17:47:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSfOT9V73B75sBemQ1CgPHi21FTmx/FKVirsqeWMjHI=;
 b=QK9Z3O6RDyaTfZvaAoyQ4Yp0bGG1SS7H8jdOcAqnTnf+inthSZFcnkxkR8jXE2+R+0amJis2NcL/D46TIGWN14imldrBG0TydPFiNnPcLmNPnVOC+O6E55IJ0tkb0drE/uyurUGxUiHcQ9RDA0J6kRIWGQNw2Nvs5ud1HLNXMMA=
Received: from SG2PR03CA0100.apcprd03.prod.outlook.com (2603:1096:4:7c::28) by
 TY2PR04MB2719.apcprd04.prod.outlook.com (2603:1096:404:4a::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.33; Wed, 13 May 2020 07:47:29 +0000
Received: from SG2APC01FT019.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:7c:cafe::e5) by SG2PR03CA0100.outlook.office365.com
 (2603:1096:4:7c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.11 via Frontend
 Transport; Wed, 13 May 2020 07:47:29 +0000
Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=KOR01-SL2-obe.outbound.protection.outlook.com;
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (192.8.245.51) by
 SG2APC01FT019.mail.protection.outlook.com (10.152.250.121) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.19 via Frontend Transport; Wed, 13 May 2020 07:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXbGKmSISo+o+rmP6N0Jhf9DDc7JPek9jmSmhCXmMcpInmPT+8OcNWcvRrdrlKIhtK19+A4A7G0YYcglomPg2JBOg4C2JGGsBH+j4D6ooyarkgIRUUcEn5/fG4FE/vEEH2qDO+74OtTT5SBOXfFAAB5FudfB1iviGshNCq+RRY7B4Jyku3yri8gxgUJq1rCji9wMGwtSmloVLnxKixxBtW3DZq6kyX0ULx48txnNq6a58WOP66vfT0c0r/CjAR2ohAudQ4enXbIUzwUeuvmL6BdJtESE5Fer4gLbEMRc4P6ZlKIILOkTOrbWqXhUJRdppoCD7Ji+/e0hiqLFiDi7GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSfOT9V73B75sBemQ1CgPHi21FTmx/FKVirsqeWMjHI=;
 b=aOP6Hjq3jKu97ZIcjqfh3Ng8dhS5RPKl53ehng+rVc0tlMGo/KWtXoYdZBzSbkOuBeC7TrBkSOVA3OXPWwIIUMLPP864j7c8EsYF2fNoi3bosl4BLJtxjomJfT7Teex+kdWx66iY9GQZT4W0Y6BzEqpczsDsGeE/PW/EqinrXm2/Am7GsBg68U/mAZzQ7DWcEk+IuFR4AMp4TM23UzwXxehTdwhqgegSMmfdSBwPZULoQoGLQjIwkn3vCBSDrPWQeNq/xGMHlXuHPzDvUd7l1jaRAHMNHDy6a3H6B3Ks4OFevmo+uFaYq+yOGWpAHncglGYgiS3Rz3x2vUGsArv3rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSfOT9V73B75sBemQ1CgPHi21FTmx/FKVirsqeWMjHI=;
 b=QK9Z3O6RDyaTfZvaAoyQ4Yp0bGG1SS7H8jdOcAqnTnf+inthSZFcnkxkR8jXE2+R+0amJis2NcL/D46TIGWN14imldrBG0TydPFiNnPcLmNPnVOC+O6E55IJ0tkb0drE/uyurUGxUiHcQ9RDA0J6kRIWGQNw2Nvs5ud1HLNXMMA=
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com (2603:1096:300:68::15)
 by PS2PR04MB3797.apcprd04.prod.outlook.com (2603:1096:300:5d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.27; Wed, 13 May
 2020 07:47:25 +0000
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969]) by PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969%7]) with mapi id 15.20.2979.033; Wed, 13 May 2020
 07:47:24 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "vernon.mauery@linux.intel.com" <vernon.mauery@linux.intel.com>,
 "tomjose@linux.vnet.ibm.com" <tomjose@linux.vnet.ibm.com>, "anoo@us.ibm.com"
 <anoo@us.ibm.com>, "dkodihal@linux.vnet.ibm.com"
 <dkodihal@linux.vnet.ibm.com>, "ratagupt@linux.vnet.ibm.com"
 <ratagupt@linux.vnet.ibm.com>
Subject: Openbmc - Ipmid Crash issue. (Help Needed)
Thread-Topic: Openbmc - Ipmid Crash issue. (Help Needed)
Thread-Index: AdYo+nU0yA0mIyrTQeislZqsPfV3IA==
Date: Wed, 13 May 2020 07:47:24 +0000
Message-ID: <PS2PR04MB3544CE3B44C0E0E7A4E4A5B7FDBF0@PS2PR04MB3544.apcprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [223.181.236.25]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: eee69961-ce55-419d-f55b-08d7f711e28f
x-ms-traffictypediagnostic: PS2PR04MB3797:|PS2PR04MB3797:|TY2PR04MB2719:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB271915A2CC07762018B6362AFDBF0@TY2PR04MB2719.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8273;
x-forefront-prvs: 0402872DA1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: vtxij1r3vRf1x1hgBz2EAGZbTQQUH+adLwkyQujcnqAjp+yYZ/J41pdXrHkjNnlospGUbFZoRMM5yWsDoLkGVugpSNfIno0v5FN9yc+xE96JN+T+BmVVNYoKLI15ZW+UPNsdTF5LDN6KjoWnuCgE4lUJq7bKrflJSZEwFefhza3Opx62e3GQABxEMyrtitk2gCLZknhpQqZjlXJ2MYfht20KWdzqCNN62kAEgIU/DF2HwadPYXyIoTuYvPos6ClRwt5TAeYU2CEnBlI7XlNPi+/+3R4WS4Xm6m0CILhzV/T7ISN9Enmtjy0QUpZDHegW45i2Y1+doeRR1WwLU1jT6K2Zc5Dq0uyYw3GQJomKaAaPJCUkvALEkBY9EkcnuXNj4EQk+8MKjW4mpp3pHLTJfK9eQkjCtbwD6hzvNKcU4ryTsFVZjvpXjn02SW3fmKLNDLSUL/SUd80vMsWe2dsUdLqfzn3LDYZXdLTuC3TPmYbuGF+8Uuw1Vmo0/5vtVUNdcDe1jZ1dsXDHPU3aN0yK5Hzo3tuE6oPqEtx5yAi+0fIyYwTY9usOddwf+MsT+tuUTKgL2HTQ7lC9ejw5bP1JR7dJR0GA3M6TLys+RVE5bbU=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PS2PR04MB3544.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(33430700001)(8936002)(33440700001)(478600001)(26005)(52536014)(2906002)(54906003)(110136005)(7696005)(9326002)(8676002)(6506007)(186003)(966005)(71200400001)(86362001)(66556008)(4326008)(66446008)(66476007)(166002)(76116006)(55016002)(64756008)(316002)(9686003)(5660300002)(33656002)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: wFpqr0hlUBsNEI9H6UjJ6ADOgRXULqcR6O0QjlX/dMpgZt+u+0D5z69gWKkhaSuuUagui18CcfrWpqqEkEDlftvMq6jKBu7bmeNVSuIzFgPJaYW9e5djfXS369Qw2hPeoFmT7v/SQwJklKmTE+VsqynfzDqo6h0ALvgpbICwQzSg+aofMZuYI0a3DfWaPWa5n4jdZ7qJVTpYQaC7xK1an9I+SpO2wEmHjbXOo5lPEGQdE6iv8M2ubOcgscHv/3W9Mzrtwdnqqq386bLvefFLFm3xSOPFcFmybwVFPMPZ6m9evggIvqgt5JEKc+7j7t3UzvwsPwp77ZsdMIrvZzTZaugEDedy2yuXmx1cL3C/+Wdcjf31Hvav7Zwyd+LH5owpbP8hT7Lq7IPq5XsgUerUehBiGXDS1pXU4PcOBOZpYioxW7UIIn0GUnk5aS6gqcqHtsauR7rAq3S+zD1ko2TJekM/fzX93UtEb6k6ES7evW6Wj4q5ZKvJcymKDvD9uQuT
Content-Type: multipart/alternative;
 boundary="_000_PS2PR04MB3544CE3B44C0E0E7A4E4A5B7FDBF0PS2PR04MB3544apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3797
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT019.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-SL2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(396003)(39860400002)(136003)(46966005)(33430700001)(7696005)(47076004)(33440700001)(86362001)(82740400003)(82310400002)(966005)(166002)(186003)(55016002)(9686003)(9326002)(26005)(6506007)(36906005)(8936002)(356005)(2906002)(81166007)(33656002)(52536014)(70206006)(110136005)(70586007)(336012)(316002)(5660300002)(4326008)(54906003)(8676002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: ce5a7098-7c1d-450d-0d6a-08d7f711e085
X-Forefront-PRVS: 0402872DA1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eXNOUVEc79xUL7ckuRw1jBsKABnxGG1svNqYymNz2a7czz2OPC4nIVIjr+rkjr3grYZA7G7tyAZhFLojO6aqxUVq8AlYXVi0Hk+7afvp6JJbXelapNZk6n5hzNhBxAPOCuu2Iw/30fb6G5dD45RMiacCsVuiIpEB5jcjpA9CJekAXGmdDfRhrs/TqjIwJP1Lh9Vr5wAzEB0vJE2j2VXECCWfQww/JNLo2Uchf3hEm+fKCaQV5MHV5WVpDKS/ZzTrFBsD8jHB51kxN12Q9oB9Ql5ZxPSXKitTo9dcZSoUxmz0HUVS8eSUpjRGvcofmneZS01rsPbnKeR2wq8Rq6kcCmVC7AjtGSSi4lizS2wJpuvf9V7lpzigd3Cfzab3j5OwrNJJmWd+RaL70XEb/01eeyCFqMuCSj+2dTAiDsf8UiMT3gFq+ebs2ZHlC6cFV5BmFLo7Km3/U0Mwcvs1CurRAA3DrLasQelhKBjk+mt5O0oRz0CVuIBXNtGltNUuM9xMlFM4en5CEgii3iWzfR9kzPNVszEDxDQnJZjU7vxbb7Kefm9LORPV+vWL7vsbtMEvzrGmok4p9oXp6HeIxw02vMB63Cp5w3/oFuqYRsrMjpVDY3xos4l/cNgE9oXLvrE9MofmI5WnEKasOgohM1V7Eg==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2020 07:47:27.8224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eee69961-ce55-419d-f55b-08d7f711e28f
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[KOR01-SL2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2719
X-Mailman-Approved-At: Wed, 13 May 2020 23:40:45 +1000
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
Cc: "Velumani T-ERS, HCLTech" <velumanit@hcl.com>,
 Patrick Williams <patrickw3@fb.com>, Vijay Khemka <vijaykhemka@fb.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_PS2PR04MB3544CE3B44C0E0E7A4E4A5B7FDBF0PS2PR04MB3544apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

          Please find below the gerrit links for the Design and Sample code=
 implementation of BIC request handling in the ipmi.

          Design : https://gerrit.openbmc-project.xyz/c/openbmc/phosphor-ho=
st-ipmid/+/32213
          Sample code implementation : https://gerrit.openbmc-project.xyz/c=
/openbmc/fb-ipmi-oem/+/32215

         So, This is regarding the ipmi implementation issue as per the new=
 design of handling BIC request,


1.       The Netfn=3D 0x38 and cmd=3D1 is verified, we are getting the comm=
ands from the BIC, the same is received at ipmb and ipmid also. The registe=
r call back is also called. When we fill up the response from the ipmiOemBi=
cHandler works fine. The response is received at the BIC as well.

2.       But as per the new design, we need to call ipmid-command handler r=
ecursively. When we get the Netfn=3D 0x38 and cmd=3D1 command in ipmiOemBic=
Handler, the handler needs to open the packet and there will be an another =
command (for ex Netfn=3D6 and cmd=3D1 get_dev_id). ipmiOemBicHandler needs =
to send this command again to ipmid for getting the response. This makes a =
recursive call.

3.       This recursive call is failed with boost::asio library, as "thread=
 operation not supported". Then we tried enabling theading in ipmid, this c=
rashes the ipmid process. (Method 2 in the gerrit link)


GDB LOG :
Program terminated with signal SIGSEGV, Segmentation fault.
#0 boost::asio::detail::epoll_reactor::epoll_reactor (ctx=3D..., this=3D<op=
timized out>)
at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:40
40 /usr/include/boost/asio/detail/impl/epoll_reactor.ipp: No such file or d=
irectory.
(gdb) bt
#0 boost::asio::detail::epoll_reactor::epoll_reactor (ctx=3D..., this=3D<op=
timized out>)
at /usr/include/boost/asio/detail/impl/epoll_reactor.ipp:40
#1 boost::asio::detail::service_registry::create<boost::asio::detail::epoll=
_reactor, boost::asio::execution_context> (owner=3D0x0)
at /usr/include/boost/asio/detail/impl/service_registry.hpp:87
#2 0x000340ac in boost::asio::detail::service_registry::do_use_service (own=
er=3D0x0, factory=3D<optimized out>, key=3D<synthetic pointer>...,
this=3D0x1879100) at /usr/include/boost/asio/detail/impl/service_registry.i=
pp:132
#3 boost::asio::detail::service_registry::do_use_service (owner=3D0x0, fact=
ory=3D<optimized out>, key=3D<synthetic pointer>..., this=3D0x1879100)
at /usr/include/boost/asio/detail/impl/service_registry.ipp:113
#4 boost::asio::detail::service_registry::use_service<boost::asio::detail::=
epoll_reactor> (this=3D0x1879100)
at /usr/include/boost/asio/detail/impl/service_registry.hpp:30
#5 boost::asio::use_service<boost::asio::detail::epoll_reactor> (e=3D...) a=
t /usr/include/boost/asio/impl/execution_context.hpp:35
#6 boost::asio::detail::reactive_descriptor_service::reactive_descriptor_se=
rvice (context=3D..., this=3D0x1879a78)
at /usr/include/boost/asio/detail/impl/reactive_descriptor_service.ipp:36
#7 boost::asio::detail::service_registry::create<boost::asio::detail::react=
ive_descriptor_service, boost::asio::io_context> (
owner=3D<optimized out>) at /usr/include/boost/asio/detail/impl/service_reg=
istry.hpp:87
#8 0x76d21b7c in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) q


Also we tried calling the recursive function with sd bus method, we see the=
 same crash. (Method 1 in the gerrit link)

GDB LOG :
Program terminated with signal SIGSEGV, Segmentation fault.
#0  0x4b8ec990 in ?? ()
(gdb) bt
#0  0x4b8ec990 in ?? ()
#1  0x4bb709a0 in ?? ()
Backtrace stopped: previous frame identical to this frame (corrupt stack?)
(gdb) list
685         /usr/include/c++/9.2.0/bits/shared_ptr.h: No such file or direc=
tory.
(gdb)
685         in /usr/include/c++/9.2.0/bits/shared_ptr.h
(gdb)


Could you please review the design and code implementation and provide your=
 comments on this.
Thanks in Advance.

Note : if we are not using recursive method, we need to rewrite most of the=
 commands Request and Response handling in the ipmid.

Thanks,
Kumar.

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

--_000_PS2PR04MB3544CE3B44C0E0E7A4E4A5B7FDBF0PS2PR04MB3544apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.textexposedshow
	{mso-style-name:text_exposed_show;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:570232692;
	mso-list-template-ids:651487972;}
@list l0:level1
	{mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hi All, <o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Please find below the gerrit links for the=
 Design and Sample code implementation of BIC request handling in the ipmi.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;Design : <a href=3D"https://gerrit.openbmc=
-project.xyz/c/openbmc/phosphor-host-ipmid/&#43;/32213">
<span style=3D"color:#1F497D;text-decoration:none">https://gerrit.openbmc-p=
roject.xyz/c/openbmc/phosphor-host-ipmid/&#43;/32213</span></a><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sample code implementation :
<a href=3D"https://gerrit.openbmc-project.xyz/c/openbmc/fb-ipmi-oem/&#43;/3=
2215"><span style=3D"color:#1F497D;text-decoration:none">https://gerrit.ope=
nbmc-project.xyz/c/openbmc/fb-ipmi-oem/&#43;/32215</span></a>
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &nbsp;&nbsp;So, This is regarding the ipmi implementation is=
sue as per the new design of handling BIC request,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"m=
so-list:Ignore">1.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">The Netfn=3D 0=
x38 and cmd=3D1 is verified, we are getting the commands from the BIC, the =
same is received at ipmb and ipmid also. The register call back is also cal=
led. When we fill up the response from
 the ipmiOemBicHandler works fine. The response is received at the BIC as w=
ell.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"m=
so-list:Ignore">2.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">But as per the=
 new design, we need to call ipmid-command handler recursively. When we get=
 the Netfn=3D 0x38 and cmd=3D1 command in ipmiOemBicHandler, the handler ne=
eds to open the packet and there will
 be an another command (for ex Netfn=3D6 and cmd=3D1 get_dev_id). ipmiOemBi=
cHandler needs to send this command again to ipmid for getting the response=
. This makes a recursive call.<o:p></o:p></span></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo1"><![if !supportLists]><span style=3D"color:#1F497D"><span style=3D"m=
so-list:Ignore">3.<span style=3D"font:7.0pt &quot;Times New Roman&quot;">&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"color:#1F497D">This recursive=
 call is failed with boost::asio library, as &#8220;thread operation not su=
pported&#8221;. Then we tried enabling theading in ipmid, this crashes the =
ipmid process. (Method 2 in the gerrit link)<o:p></o:p></span></p>
<p class=3D"MsoListParagraph"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:=
p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">GDB LOG :<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Program terminated wit=
h signal SIGSEGV, Segmentation fault.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#0 boost::asio::detail=
::epoll_reactor::epoll_reactor (ctx=3D..., this=3D&lt;optimized out&gt;)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">at /usr/include/boost/=
asio/detail/impl/epoll_reactor.ipp:40<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">40 /usr/include/boost/=
asio/detail/impl/epoll_reactor.ipp: No such file or directory.<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">(gdb) bt<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#0 boost::asio::detail=
::epoll_reactor::epoll_reactor (ctx=3D..., this=3D&lt;optimized out&gt;)<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">at /usr/include/boost/=
asio/detail/impl/epoll_reactor.ipp:40<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#1 boost::asio::detail=
::service_registry::create&lt;boost::asio::detail::epoll_reactor, boost::as=
io::execution_context&gt; (owner=3D0x0)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">at /usr/include/boost/=
asio/detail/impl/service_registry.hpp:87<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#2 0x000340ac in boost=
::asio::detail::service_registry::do_use_service (owner=3D0x0, factory=3D&l=
t;optimized out&gt;, key=3D&lt;synthetic pointer&gt;...,<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">this=3D0x1879100) at /=
usr/include/boost/asio/detail/impl/service_registry.ipp:132<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#3 boost::asio::detail=
::service_registry::do_use_service (owner=3D0x0, factory=3D&lt;optimized ou=
t&gt;, key=3D&lt;synthetic pointer&gt;..., this=3D0x1879100)<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">at /usr/include/boost/=
asio/detail/impl/service_registry.ipp:113<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#4 boost::asio::detail=
::service_registry::use_service&lt;boost::asio::detail::epoll_reactor&gt; (=
this=3D0x1879100)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">at /usr/include/boost/=
asio/detail/impl/service_registry.hpp:30<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#5 boost::asio::use_se=
rvice&lt;boost::asio::detail::epoll_reactor&gt; (e=3D...) at /usr/include/b=
oost/asio/impl/execution_context.hpp:35<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#6 boost::asio::detail=
::reactive_descriptor_service::reactive_descriptor_service (context=3D..., =
this=3D0x1879a78)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">at /usr/include/boost/=
asio/detail/impl/reactive_descriptor_service.ipp:36<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#7 boost::asio::detail=
::service_registry::create&lt;boost::asio::detail::reactive_descriptor_serv=
ice, boost::asio::io_context&gt; (<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">owner=3D&lt;optimized =
out&gt;) at /usr/include/boost/asio/detail/impl/service_registry.hpp:87<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#8 0x76d21b7c in ?? ()=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Backtrace stopped: pre=
vious frame identical to this frame (corrupt stack?)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">(gdb) q<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Also we tried calling =
the recursive function with sd bus method, we see the same crash. (Method 1=
 in the gerrit link)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">GDB LOG :<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Program terminated wit=
h signal SIGSEGV, Segmentation fault.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#0&nbsp; 0x4b8ec990 in=
 ?? ()<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">(gdb) bt<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#0&nbsp; 0x4b8ec990 in=
 ?? ()<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">#1&nbsp; 0x4bb709a0 in=
 ?? ()<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Backtrace stopped: pre=
vious frame identical to this frame (corrupt stack?)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">(gdb) list<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">685&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /usr/include/c&#43;&#43;/9.2.0/bits/shared_pt=
r.h: No such file or directory.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">(gdb) <o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">685&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; in /usr/include/c&#43;&#43;/9.2.0/bits/shared=
_ptr.h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">(gdb)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Could you please revie=
w the design and code implementation and provide your comments on this.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks in Advance.<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Note : if we are not u=
sing recursive method, we need to rewrite most of the commands Request and =
Response handling in the ipmid. &nbsp;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Thanks,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Kumar.<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<font face=3D"Arial" color=3D"Gray" size=3D"1">::DISCLAIMER::<br>
<hr>
The contents of this e-mail and any attachment(s) are confidential and inte=
nded for the named recipient(s) only. E-mail transmission is not guaranteed=
 to be secure or error-free as information could be intercepted, corrupted,=
 lost, destroyed, arrive late or
 incomplete, or may contain viruses in transmission. The e mail and its con=
tents (with or without referred errors) shall therefore not attach any liab=
ility on the originator or HCL or its affiliates. Views or opinions, if any=
, presented in this email are solely
 those of the author and may not necessarily reflect the views or opinions =
of HCL or its affiliates. Any form of reproduction, dissemination, copying,=
 disclosure, modification, distribution and / or publication of this messag=
e without the prior written consent
 of authorized representative of HCL is strictly prohibited. If you have re=
ceived this email in error please delete it and notify the sender immediate=
ly. Before opening any email and/or attachments, please check them for viru=
ses and other defects.<br>
<hr>
</font>
</body>
</html>

--_000_PS2PR04MB3544CE3B44C0E0E7A4E4A5B7FDBF0PS2PR04MB3544apcp_--
