Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AEF2E2836
	for <lists+openbmc@lfdr.de>; Thu, 24 Dec 2020 18:08:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1xPD0CFkzDqNg
	for <lists+openbmc@lfdr.de>; Fri, 25 Dec 2020 04:08:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.129; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=manikandan.e@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=quarantine dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=Y0Jfn3wm; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=Y0Jfn3wm; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310129.outbound.protection.outlook.com [40.107.131.129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1xNL28tjzDqKW
 for <openbmc@lists.ozlabs.org>; Fri, 25 Dec 2020 04:07:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSyLmLyVrUZnJbTc4rjpouzqrJxu3KcdCfSeMnrirXA=;
 b=Y0Jfn3wmTMDaXDuKqL1fkFhRi79Va8RSfTjPOCWfPY373AehFeyjAK8cbTHzOjhrzzz/rUWW96qRAPXj0g5ay2HI6EhMtB80n7s/8YNiey2Q9c3CseVPoWil6yn5TYo7vmBin1BWs9n/LbO47cOAbCc6YMk4KWRLmLxEfOk1w+8=
Received: from SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) by SG2PR04MB3897.apcprd04.prod.outlook.com
 (2603:1096:4:9f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 17:07:41 +0000
Received: from SG2APC01FT062.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:28:cafe::d1) by SG2PR01CA0175.outlook.office365.com
 (2603:1096:4:28::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27 via Frontend
 Transport; Thu, 24 Dec 2020 17:07:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.195.57)
 smtp.mailfrom=hcl.com; lists.ozlabs.org; dkim=pass (signature was verified)
 header.d=HCL.COM;lists.ozlabs.org; dmarc=pass action=none
 header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.195.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.195.57; helo=JPN01-OS2-obe.outbound.protection.outlook.com;
Received: from JPN01-OS2-obe.outbound.protection.outlook.com (192.8.195.57) by
 SG2APC01FT062.mail.protection.outlook.com (10.152.251.161) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3700.27 via Frontend Transport; Thu, 24 Dec 2020 17:07:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFVYLu33rpDfAOIUCIfvMgHHeY/yffXK64TKzg9Vr1f29kCXPvIbgLlDajDSVeYyr9EHEaSGBBbbAg3IdkSNzqqr3tKtbhXvpsAZAZMdXTNZBKy24OkbicP73cacjv+9nacKmjoYZQah9ERduZY10H5c9Oy0gTl/ioUpWt8irhHZ6351UvvRZrmh3Gj9OhJ6egF+Xjn0uEB4MqQZt1T5fbCsflu0b2jbRZNHMgMwNjchYShMH8TYTPT1PtsoRfqM0Hrb5Bp9NHf33Y7Hape1cxJERU6KgR+Jd1ZhzeCdSw/KI9EoRzS0KWd5tePX1O27D7qni1BodDZQZS9cz/MuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSyLmLyVrUZnJbTc4rjpouzqrJxu3KcdCfSeMnrirXA=;
 b=bB741yf8QI80SD59x1wUA8T5gGTRL8s5KuYrz9IHFHBJly14i73UHIpmDA67aGh4z3945dMMAJZCgayY11yuXmbaNVtJ/7Z0RxQunMLOpk8ytVDTnFEzBq6BsPd1ExBjU4x9itESCrpZfMBcBK7Qa54mrG6sZjvl4yotNEpWAIZo6YQeYelegtGKwKdgTQ5MJ6GHBQOIChWg5qvafoC/cxZ9Kj9PKibi7yaOmzGlQlvyUc5D8XYtf3pqx+OqSOQyjdLo7n8a9BpZT7qBi9hOtIS7mTcyok0SPufMo+V+yzYt1IHpmcbGzPcZYTzWM7Ex7EuUtL/NOuyUMY/+XDd8nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSyLmLyVrUZnJbTc4rjpouzqrJxu3KcdCfSeMnrirXA=;
 b=Y0Jfn3wmTMDaXDuKqL1fkFhRi79Va8RSfTjPOCWfPY373AehFeyjAK8cbTHzOjhrzzz/rUWW96qRAPXj0g5ay2HI6EhMtB80n7s/8YNiey2Q9c3CseVPoWil6yn5TYo7vmBin1BWs9n/LbO47cOAbCc6YMk4KWRLmLxEfOk1w+8=
Received: from TY2PR04MB3038.apcprd04.prod.outlook.com (2603:1096:404:a4::20)
 by TYAPR04MB2301.apcprd04.prod.outlook.com (2603:1096:404:22::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.27; Thu, 24 Dec
 2020 17:07:35 +0000
Received: from TY2PR04MB3038.apcprd04.prod.outlook.com
 ([fe80::549a:67e4:847e:45d6]) by TY2PR04MB3038.apcprd04.prod.outlook.com
 ([fe80::549a:67e4:847e:45d6%6]) with mapi id 15.20.3676.029; Thu, 24 Dec 2020
 17:07:35 +0000
From: Manikandan E <manikandan.e@hcl.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Re: openbmc Digest, Vol 64, Issue 61
Thread-Topic: openbmc Digest, Vol 64, Issue 61
Thread-Index: AQHW2gxKSTNtsrli3kWCgplafS6JsaoGeZbv
Date: Thu, 24 Dec 2020 17:07:35 +0000
Message-ID: <TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0@TY2PR04MB3038.apcprd04.prod.outlook.com>
References: <mailman.885.1608824855.21947.openbmc@lists.ozlabs.org>
In-Reply-To: <mailman.885.1608824855.21947.openbmc@lists.ozlabs.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
Authentication-Results-Original: lists.ozlabs.org; dkim=none (message not
 signed) header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=hcl.com;
x-originating-ip: [112.133.236.35]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 05debd51-5d9f-4de5-b3a9-08d8a82e6b89
x-ms-traffictypediagnostic: TYAPR04MB2301:|SG2PR04MB3897:
X-Microsoft-Antispam-PRVS: <SG2PR04MB3897A3FAB2AC46A3D04B309A9DDD0@SG2PR04MB3897.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: xdD3sYni3SpjBlHbicWpP4qKHX8jqWlCC/YmneWXqygmQLXb9EwkyuTbRf1PEr5CN+oQyC4RefEamKt5KTcD1dN2J5yKtJmwXREvPm4MoohNorxBDq+HV/z4HEpS2E3j2s7EcbFlaqzk/QwLuYuFOiQQTe4fahlsEx3IXYrVaaOMZUiW4WYuMxdp7DupJHmvva16UY4oTssl+7GmhWkD+eaT6qiIjkDBRX4GQSLppIKYdivJTltaDUWQ7SjqrWexWdDISkSIO772D9JrFTGd2QYcMGYQ3FTO6KYIraVZvl+GTpantJ7/4ePjDHegQAw4Yv/FSgbFVPgKhsqgE2P+M38/1rQKXIRv97Vsco77+SuyP37c+RthWMCdk/YFbWbE2QxgT8Mo9TfcYn1KUi0SjraDU0hNlDKeajk6oB2uM3PRkfklIVY/9uww9Kc2eoSNvsz9PA85Qcz2CLb7k03x8Q==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:TY2PR04MB3038.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(55016002)(166002)(8936002)(52536014)(5660300002)(83380400001)(19627405001)(86362001)(33656002)(45080400002)(6916009)(8676002)(71200400001)(478600001)(7696005)(30864003)(966005)(91956017)(316002)(66446008)(9686003)(64756008)(6506007)(66556008)(66616009)(53546011)(76116006)(186003)(26005)(2906002)(99936003)(66476007)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?BSC3dOTrZM2fs639DyFyiHYopFE2bnqu5fayFpogsmCe8S5iTxMNfDUJ?=
 =?Windows-1252?Q?lCSrfq6Ki7qJU7MBpuJuQ6KqjOIgwrJJXISNBXiRjjbTL4mgb/y8WiYf?=
 =?Windows-1252?Q?RqGx9DgOsvJkljH9uK3dWwi8QK7ahx8Za+HVKMQzNera3IBOF/6K7Wsl?=
 =?Windows-1252?Q?LSHjdV8Ws+K3MYSGMLpgrrRqkLZySQd73Y2QOITihjyeVb/1kZJS2MCr?=
 =?Windows-1252?Q?2UsIoGX09A8CCw4G5/FIKKdsSbLPlKW7HGvNGpsNXlbBuwps+cAVYGfo?=
 =?Windows-1252?Q?lCQuZQCz1ejxTLdPNg/CasgzXxGCIxRUHw6sHX9v7YHXnG4wksNMCJac?=
 =?Windows-1252?Q?LHrCwEnWV2k5Z22Aw9UeV13lv77NL+lmVDnTPqspGkkWTBjel7zk3OdI?=
 =?Windows-1252?Q?nkeYpYrMxQNg84vc396ADPXi/3ZJ2Aw6Hos8ynJ9b5eGmtjjt+NopYKT?=
 =?Windows-1252?Q?4P5ureQnTW8Qtt/MgSMHhU0MTbeq+L8AX7UrNCEE0tB7OP/TfgCfJ6iX?=
 =?Windows-1252?Q?+fCX8gd8p6yrfnzBxDPtO+fN9jiGGtnCdiI42BVzfpU+oPLukhKiLszn?=
 =?Windows-1252?Q?9NS3dZuykzCTiy37kvOfERfE1bYfsS5lqD2aYop+/12LjpT9b9b/ssg1?=
 =?Windows-1252?Q?6fRDR77sCR2jaVPj5vQw1dfVcL6gsgpUVxEw4BlEAVrww0DMHi0T3ErL?=
 =?Windows-1252?Q?Y1gEGXrSFBAeLs+mlvLPvRULfF2Wa2IiO8p9RlN2ZWf/tgK+8SWgbFVA?=
 =?Windows-1252?Q?uFke/TzF3K7GpEE2svSy+CXnWPeImYF3za09QO2V7uco9htcSoaQur0X?=
 =?Windows-1252?Q?81pDY7CZ514h/BbfNNZQlFDojue7QQcBJKNdkSbnvr0c01xv+oipGyJv?=
 =?Windows-1252?Q?dz7QbyUUO326q7kXp0oC7KMHwr13OsKn7Vbi+1EqNS1Azqern4QFkp+B?=
 =?Windows-1252?Q?lPNlTl+GS2GgXlserwJJh3rZTDNXsDwJmnZNSGxA10mgRC5HzafIkGvj?=
 =?Windows-1252?Q?yfrJuU2bsrCzyVjdi1j41p2bG3WwUJ4r+EJiaAlzhmTJH+EmhUM=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/mixed;
 boundary="_004_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_"
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR04MB2301
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT062.eop-APC01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d1efcfaa-421e-4fae-96b4-08d8a82e68fb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N68GWgGt3UZknY2KJKf/Fopxkhg2o66QcRxmw0Ab6Y2iE5ZexY3lNcAiOL2ewJTe/kHGHas4WwXx/iMQf57+HltEPc3EYuxzxJw3brz5N5Q+AYHO1J2XhgqgNQjD13KJafifk1u7+Vv+/OF7Xu8xIDW+/PWh0akUqxPzOOmGitWYqHAMohMZZ3ABph1KGFLNNsb1YRMxa0STS64cfo5mcCZ6m3+n1Qx5YWjSpv5yOEtKSEaQ+XNa88cCN8M8gCt7QSRl7Ubn0pwE04D5tNhK2Q0Pju8crgG3HV7i3Dr8onlFhrDaBBYZJgCLzEzY3E2AGg1K3yvR9Zwi6uCRg/+H7aSiytUrgrUfAkI52M8yevM6xHuJQ0jcf4rab/IjJBdsEp9C5f9uHMH5rBBz9HfDZ7lTr9OK1dVTH+S2Fo2Thlow1DGH17xFXIJC+7ZFyTcbH/Pt2JjM87uRXSz47leU9oftNUQF5gpFLsSeJLVodbD9BhLLKWppyA0jYkQdH1fcBSrJ8S3U5jWL4f3dikqUvfumCTkfwzkKWMAUC631Z2FCB0VXgeW7PVor1ugpDahGQUcPes2TqHUH6n4LV/w8mq7xeBS8UFGNPehflGPVndg=
X-Forefront-Antispam-Report: CIP:192.8.195.57; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:JPN01-OS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(46966006)(478600001)(7696005)(166002)(186003)(36906005)(30864003)(26005)(235185007)(52536014)(70206006)(33656002)(5660300002)(336012)(66616009)(70586007)(53546011)(83380400001)(47076005)(316002)(19627405001)(86362001)(2906002)(6506007)(45080400002)(966005)(81166007)(356005)(82310400003)(19627235002)(82740400003)(99936003)(6916009)(9686003)(8936002)(8676002)(55016002)(34020700004)(2022615005);
 DIR:OUT; SFP:1102; 
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2020 17:07:39.1846 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05debd51-5d9f-4de5-b3a9-08d8a82e6b89
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.195.57];
 Helo=[JPN01-OS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: SG2APC01FT062.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3897
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_004_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_
Content-Type: multipart/alternative;
	boundary="_000_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_"

--_000_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Dear Kotes,

I am not able to change RM in ESS as attached snap issue and raised SSD  .

Will update RM after issue is fixed.


Thanks
Mani.E
________________________________
From: openbmc <openbmc-bounces+manikandan.e=3Dhcl.com@lists.ozlabs.org> on =
behalf of openbmc-request@lists.ozlabs.org <openbmc-request@lists.ozlabs.or=
g>
Sent: 24 December 2020 21:17
To: openbmc@lists.ozlabs.org <openbmc@lists.ozlabs.org>
Subject: openbmc Digest, Vol 64, Issue 61

[CAUTION: This Email is from outside the Organization. Unless you trust the=
 sender, Don=92t click links or open attachments as it may be a Phishing em=
ail, which can steal your Information and compromise your Computer.]

Send openbmc mailing list submissions to
        openbmc@lists.ozlabs.org

To subscribe or unsubscribe via the World Wide Web, visit
        https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Flists.ozlabs.org%2Flistinfo%2Fopenbmc&amp;data=3D04%7C01%7Cmanikandan.e%40=
hcl.com%7Cf3a0dcdc61be45d37abe08d8a8236b42%7C189de737c93a4f5a8b686f4ca99419=
12%7C0%7C0%7C637444217385303803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDA=
iLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DVvMdH6Qw=
pLbItcdbbVrEDYfPPCG2OGBBxCC%2FqAb57F8%3D&amp;reserved=3D0
or, via email, send a message with subject or body 'help' to
        openbmc-request@lists.ozlabs.org

You can reach the person managing the list at
        openbmc-owner@lists.ozlabs.org

When replying, please edit your Subject line so it is more specific
than "Re: Contents of openbmc digest..."


Today's Topics:

   1. Re: create meta-ampere folder in openbmc repo (Thang Q. Nguyen)
   2. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
      Nonfunctional. (Lei Yu)
   3. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
      Nonfunctional. (Thu Nguyen)
   4. peci-pcie CI issues (Andrei Kartashev)


----------------------------------------------------------------------

Message: 1
Date: Thu, 24 Dec 2020 08:46:47 +0700
From: "Thang Q. Nguyen" <thang@os.amperecomputing.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, OpenBMC Maillist
        <openbmc@lists.ozlabs.org>
Subject: Re: create meta-ampere folder in openbmc repo
Message-ID:
        <0e2507bc-f8c5-85c4-cd39-4c603a729f4c@os.amperecomputing.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

Hi Brad,

Can you help create the meta-ampere folder inside the openbmc repository?


Best Regards,

Thang Q. Nguyen -

On 12/16/20 16:54, Thang Q. Nguyen wrote:
> Hi Brad,
>
> Please help add meta-ampere repository into openbmc as a subtree.
> The meta-ampere repository has been populated with basic bring up code.
>
> Thanks,
> Thang Q. Nguyen
>


------------------------------

Message: 2
Date: Thu, 24 Dec 2020 09:52:29 +0800
From: Lei Yu <yulei.sh@bytedance.com>
To: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
        Nonfunctional.
Message-ID:
        <CAGm54UEr=3DjX1jHFYG37BthZ0YoVeqcAtk3NrrFXf=3Dki7Vfzm5A@mail.gmail=
.com>
Content-Type: text/plain; charset=3D"UTF-8"

On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen
<thu@amperemail.onmicrosoft.com> wrote:
>
> On 12/16/20 14:33, Thu Nguyen wrote:
> > Hi All,
> >
> >
> > I'm working with Fan sensors on Ampere MtJade platform.
> >
> > In this platform, I have multiple fans which name as FAN3_1, FAN3_2,
> > FAN4_1, FAN4_2, FAN5_1...
> >
> > I added the configuration for those fans in phosphor-hwmon and I also
> > added option "--enable-update-functional-on-fail" in phosphor-hwmon
> > build flag. I'm trying to set fan functional to false when unplug fan.
> >
> > Flash new image to the board, read functional of fans. The time to
> > read dbus property is about 0.05->0.1 seconds:
> >
> > root@mtjade:~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN4_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> > real    0m0.078s
> > user    0m0.002s
> > sys    0m0.032s
> > root@mtjade:~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN3_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> >
> > real    0m0.044s
> > user    0m0.001s
> > sys    0m0.034s
> >
> > After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2
> > is set to false as expected. And functional of others fans keeps
> > true. But the time to get dbus properties of all fans have a huge
> > increasement event in the working fans.
> >
> > ~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN4_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b false
> >
> > real    0m1.189s
> > user    0m0.001s
> > sys    0m0.036s
> >
> > ~# time busctl get-property
> > xyz.openbmc_project.Hwmon-1644477290.Hwmon1
> > /xyz/openbmc_project/sensors/fan_tach/FAN3_2
> > xyz.openbmc_project.State.Decorator.OperationalStatus Functional
> > b true
> >
> > real    0m3.285s
> > user    0m0.010s
> > sys    0m0.028s
> >
> > The "ipmitool sdr type 0x4" commands is also failed because this
> > increasement.
> >
> > ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr
> > type 0x4
> > FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
> > FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
> > FAN4_1           | 2Bh | ns  | 29.19 | No Reading
> > FAN4_2           | 2Eh | ns  | 29.22 | No Reading
> > FAN5_1           | 31h | ns  | 29.25 | No Reading
> > FAN5_2           | 34h | ns  | 29.28 | No Reading
> > FAN6_1           | 37h | ns  | 29.31 | No Reading
> > FAN6_2           | 3Ah | ns  | 29.34 | No Reading
> > FAN7_1           | 3Dh | ns  | 29.37 | No Reading
> > FAN7_2           | 40h | ns  | 29.40 | No Reading
> > FAN8_1           | 43h | ns  | 29.43 | No Reading
> > FAN8_2           | 46h | ns  | 29.46 | No Reading
> > PSU0_fan1        | F5h | ns  | 29.60 | No Reading
> > PSU1_fan1        | F6h | ns  | 29.61 | No Reading
> >
> > real    2m43.704s
> > user    0m0.046s
> > sys    0m0.057s
> >
> > The cause of this increasement is when it failed to read one sensor
> > phosphor-hwmon keep trying to read the sensors with the retry is 10
> > and the 100ms delays between retry times.
> >
> > Should we reduce the retry for non-functional sensors?

When a fan is unplugged, its "Present" property should be false as well.
Maybe you could check that property and skip such fans?

> >
> >
> > Regards.
> >
> > Thu Nguyen
> Hi All,
>
> Any feed back on this?
>
> Thu Nguyen,
>


--
BRs,
Lei YU


------------------------------

Message: 3
Date: Thu, 24 Dec 2020 09:32:14 +0700
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
To: Lei Yu <yulei.sh@bytedance.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is
        Nonfunctional.
Message-ID:
        <2c526c72-bcad-4751-d18b-3b07ffd12964@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed

On 12/24/20 08:52, Lei Yu wrote:
> On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen
> <thu@amperemail.onmicrosoft.com> wrote:
>> On 12/16/20 14:33, Thu Nguyen wrote:
>>> Hi All,
>>>
>>>
>>> I'm working with Fan sensors on Ampere MtJade platform.
>>>
>>> In this platform, I have multiple fans which name as FAN3_1, FAN3_2,
>>> FAN4_1, FAN4_2, FAN5_1...
>>>
>>> I added the configuration for those fans in phosphor-hwmon and I also
>>> added option "--enable-update-functional-on-fail" in phosphor-hwmon
>>> build flag. I'm trying to set fan functional to false when unplug fan.
>>>
>>> Flash new image to the board, read functional of fans. The time to
>>> read dbus property is about 0.05->0.1 seconds:
>>>
>>> root@mtjade:~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> real    0m0.078s
>>> user    0m0.002s
>>> sys    0m0.032s
>>> root@mtjade:~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN3_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>>
>>> real    0m0.044s
>>> user    0m0.001s
>>> sys    0m0.034s
>>>
>>> After unplug one fan (FAN4_2), I can see that fan functional of FAN4_2
>>> is set to false as expected. And functional of others fans keeps
>>> true. But the time to get dbus properties of all fans have a huge
>>> increasement event in the working fans.
>>>
>>> ~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN4_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b false
>>>
>>> real    0m1.189s
>>> user    0m0.001s
>>> sys    0m0.036s
>>>
>>> ~# time busctl get-property
>>> xyz.openbmc_project.Hwmon-1644477290.Hwmon1
>>> /xyz/openbmc_project/sensors/fan_tach/FAN3_2
>>> xyz.openbmc_project.State.Decorator.OperationalStatus Functional
>>> b true
>>>
>>> real    0m3.285s
>>> user    0m0.010s
>>> sys    0m0.028s
>>>
>>> The "ipmitool sdr type 0x4" commands is also failed because this
>>> increasement.
>>>
>>> ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H <BMCIP> sdr
>>> type 0x4
>>> FAN3_1           | 25h | ok  | 29.13 | 5100 RPM
>>> FAN3_2           | 28h | ok  | 29.16 | 4700 RPM
>>> FAN4_1           | 2Bh | ns  | 29.19 | No Reading
>>> FAN4_2           | 2Eh | ns  | 29.22 | No Reading
>>> FAN5_1           | 31h | ns  | 29.25 | No Reading
>>> FAN5_2           | 34h | ns  | 29.28 | No Reading
>>> FAN6_1           | 37h | ns  | 29.31 | No Reading
>>> FAN6_2           | 3Ah | ns  | 29.34 | No Reading
>>> FAN7_1           | 3Dh | ns  | 29.37 | No Reading
>>> FAN7_2           | 40h | ns  | 29.40 | No Reading
>>> FAN8_1           | 43h | ns  | 29.43 | No Reading
>>> FAN8_2           | 46h | ns  | 29.46 | No Reading
>>> PSU0_fan1        | F5h | ns  | 29.60 | No Reading
>>> PSU1_fan1        | F6h | ns  | 29.61 | No Reading
>>>
>>> real    2m43.704s
>>> user    0m0.046s
>>> sys    0m0.057s
>>>
>>> The cause of this increasement is when it failed to read one sensor
>>> phosphor-hwmon keep trying to read the sensors with the retry is 10
>>> and the 100ms delays between retry times.
>>>
>>> Should we reduce the retry for non-functional sensors?
> When a fan is unplugged, its "Present" property should be false as well.
> Maybe you could check that property and skip such fans?
>
In the sensor Dbus object, we don't have the present property. The
present property is belong to the inventory object of the phosphor-fan.

If using present properties, we have to map the fan sensor name with the
corresponding inventory object. We will break the generic character of
phosphor-hwmon.

As my opinion, for hotplug supporting devices such as fans, we should
not retry when failed to read. Because there are no difference between
the fan sensors are failed to read or the fan sensors are unplugged with
the fan.

Is it reasonable to retry to read the failed sensors after each 0.1
seconds?

>>>
>>> Regards.
>>>
>>> Thu Nguyen
>> Hi All,
>>
>> Any feed back on this?
>>
>> Thu Nguyen,
>>
>



------------------------------

Message: 4
Date: Thu, 24 Dec 2020 18:47:23 +0300
From: Andrei Kartashev <a.kartashev@yadro.com>
To: jason.m.bills <jason.m.bills@linux.intel.com>
Cc: openbmc <openbmc@lists.ozlabs.org>
Subject: peci-pcie CI issues
Message-ID: <6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com>
Content-Type: text/plain; charset=3D"UTF-8"

Hello Jason,

I push several patches to peci-pcie repo, but looks like CI broken
there. Could you take a look on how to fix CI?

[ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o
In file included from /usr/local/include/boost/asio/execution.hpp:19,
                 from /usr/local/include/boost/asio/system_executor.hpp:20,
                 from /usr/local/include/boost/asio/associated_executor.hpp=
:22,
                 from /usr/local/include/boost/asio/detail/bind_handler.hpp=
:20,
                 from /usr/local/include/boost/asio/detail/wrapped_handler.=
hpp:18,
                 from /usr/local/include/boost/asio/io_context.hpp:23,
                 from /usr/local/include/boost/asio/io_service.hpp:18,
                 from /home/jenkins-op/workspace/ci-repository/openbmc/peci=
-pcie/src/peci_pcie.cpp:22:
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info& boost::asio::execution::detail::an=
y_executor_base::target_type_void()???:
/usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error: can=
not use ???typeid??? with ???-fno-rtti???
  811 |     return typeid(void);
      |                       ^
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info& boost::asio::execution::detail::an=
y_executor_base::target_type_ex()???:
/usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error: can=
not use ???typeid??? with ???-fno-rtti???
  851 |     return typeid(Ex);
      |                     ^

--
Best regards,
Andrei Kartashev




End of openbmc Digest, Vol 64, Issue 61
***************************************
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

--_000_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Dear Kotes,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I am not able to change RM in ESS as attached snap issue and raised SSD&nbs=
p; .</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Will update RM after issue is fixed.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Mani.E<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openbmc &lt;openbmc-b=
ounces+manikandan.e=3Dhcl.com@lists.ozlabs.org&gt; on behalf of openbmc-req=
uest@lists.ozlabs.org &lt;openbmc-request@lists.ozlabs.org&gt;<br>
<b>Sent:</b> 24 December 2020 21:17<br>
<b>To:</b> openbmc@lists.ozlabs.org &lt;openbmc@lists.ozlabs.org&gt;<br>
<b>Subject:</b> openbmc Digest, Vol 64, Issue 61</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[CAUTION: This Email is from outside the Organizat=
ion. Unless you trust the sender, Don=92t click links or open attachments a=
s it may be a Phishing email, which can steal your Information and compromi=
se your Computer.]<br>
<br>
Send openbmc mailing list submissions to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openbmc@lists.ozlabs.org<br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"https://apc01.safelin=
ks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.ozlabs.org%2Flistinfo%=
2Fopenbmc&amp;amp;data=3D04%7C01%7Cmanikandan.e%40hcl.com%7Cf3a0dcdc61be45d=
37abe08d8a8236b42%7C189de737c93a4f5a8b686f4ca9941912%7C0%7C0%7C637444217385=
303803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVvMdH6QwpLbItcdbbVrEDYfPPCG2O=
GBBxCC%2FqAb57F8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.o=
zlabs.org%2Flistinfo%2Fopenbmc&amp;amp;data=3D04%7C01%7Cmanikandan.e%40hcl.=
com%7Cf3a0dcdc61be45d37abe08d8a8236b42%7C189de737c93a4f5a8b686f4ca9941912%7=
C0%7C0%7C637444217385303803%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJ=
QIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DVvMdH6Qw=
pLbItcdbbVrEDYfPPCG2OGBBxCC%2FqAb57F8%3D&amp;amp;reserved=3D0</a><br>
or, via email, send a message with subject or body 'help' to<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openbmc-request@lists.ozlabs.org=
<br>
<br>
You can reach the person managing the list at<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; openbmc-owner@lists.ozlabs.org<b=
r>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of openbmc digest...&quot;<br>
<br>
<br>
Today's Topics:<br>
<br>
&nbsp;&nbsp; 1. Re: create meta-ampere folder in openbmc repo (Thang Q. Ngu=
yen)<br>
&nbsp;&nbsp; 2. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional. (Lei Yu)<br>
&nbsp;&nbsp; 3. Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional. (Thu Nguyen)<br>
&nbsp;&nbsp; 4. peci-pcie CI issues (Andrei Kartashev)<br>
<br>
<br>
----------------------------------------------------------------------<br>
<br>
Message: 1<br>
Date: Thu, 24 Dec 2020 08:46:47 +0700<br>
From: &quot;Thang Q. Nguyen&quot; &lt;thang@os.amperecomputing.com&gt;<br>
To: Brad Bishop &lt;bradleyb@fuzziesquirrel.com&gt;, OpenBMC Maillist<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;openbmc@lists.ozlabs.org&gt;=
<br>
Subject: Re: create meta-ampere folder in openbmc repo<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;0e2507bc-f8c5-85c4-cd39-4c60=
3a729f4c@os.amperecomputing.com&gt;<br>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed<br>
<br>
Hi Brad,<br>
<br>
Can you help create the meta-ampere folder inside the openbmc repository?<b=
r>
<br>
<br>
Best Regards,<br>
<br>
Thang Q. Nguyen -<br>
<br>
On 12/16/20 16:54, Thang Q. Nguyen wrote:<br>
&gt; Hi Brad,<br>
&gt;<br>
&gt; Please help add meta-ampere repository into openbmc as a subtree.<br>
&gt; The meta-ampere repository has been populated with basic bring up code=
.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Thang Q. Nguyen<br>
&gt;<br>
<br>
<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Thu, 24 Dec 2020 09:52:29 +0800<br>
From: Lei Yu &lt;yulei.sh@bytedance.com&gt;<br>
To: Thu Nguyen &lt;thu@amperemail.onmicrosoft.com&gt;<br>
Cc: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional.<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;CAGm54UEr=3DjX1jHFYG37BthZ0Y=
oVeqcAtk3NrrFXf=3Dki7Vfzm5A@mail.gmail.com&gt;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen<br>
&lt;thu@amperemail.onmicrosoft.com&gt; wrote:<br>
&gt;<br>
&gt; On 12/16/20 14:33, Thu Nguyen wrote:<br>
&gt; &gt; Hi All,<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; I'm working with Fan sensors on Ampere MtJade platform.<br>
&gt; &gt;<br>
&gt; &gt; In this platform, I have multiple fans which name as FAN3_1, FAN3=
_2,<br>
&gt; &gt; FAN4_1, FAN4_2, FAN5_1...<br>
&gt; &gt;<br>
&gt; &gt; I added the configuration for those fans in phosphor-hwmon and I =
also<br>
&gt; &gt; added option &quot;--enable-update-functional-on-fail&quot; in ph=
osphor-hwmon<br>
&gt; &gt; build flag. I'm trying to set fan functional to false when unplug=
 fan.<br>
&gt; &gt;<br>
&gt; &gt; Flash new image to the board, read functional of fans. The time t=
o<br>
&gt; &gt; read dbus property is about 0.05-&gt;0.1 seconds:<br>
&gt; &gt;<br>
&gt; &gt; root@mtjade:~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b true<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m0.078s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.002s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.032s<br>
&gt; &gt; root@mtjade:~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b true<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m0.044s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.034s<br>
&gt; &gt;<br>
&gt; &gt; After unplug one fan (FAN4_2), I can see that fan functional of F=
AN4_2<br>
&gt; &gt; is set to false as expected. And functional of others fans keeps<=
br>
&gt; &gt; true. But the time to get dbus properties of all fans have a huge=
<br>
&gt; &gt; increasement event in the working fans.<br>
&gt; &gt;<br>
&gt; &gt; ~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b false<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m1.189s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.036s<br>
&gt; &gt;<br>
&gt; &gt; ~# time busctl get-property<br>
&gt; &gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt; &gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt; &gt; xyz.openbmc_project.State.Decorator.OperationalStatus Functional<=
br>
&gt; &gt; b true<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 0m3.285s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.010s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.028s<br>
&gt; &gt;<br>
&gt; &gt; The &quot;ipmitool sdr type 0x4&quot; commands is also failed bec=
ause this<br>
&gt; &gt; increasement.<br>
&gt; &gt;<br>
&gt; &gt; ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H &lt;BMCIP=
&gt; sdr<br>
&gt; &gt; type 0x4<br>
&gt; &gt; FAN3_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 25h | ok&nbsp; | 29.13 | 5100 RPM<br>
&gt; &gt; FAN3_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 28h | ok&nbsp; | 29.16 | 4700 RPM<br>
&gt; &gt; FAN4_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 2Bh | ns&nbsp; | 29.19 | No Reading<br>
&gt; &gt; FAN4_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 2Eh | ns&nbsp; | 29.22 | No Reading<br>
&gt; &gt; FAN5_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 31h | ns&nbsp; | 29.25 | No Reading<br>
&gt; &gt; FAN5_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 34h | ns&nbsp; | 29.28 | No Reading<br>
&gt; &gt; FAN6_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 37h | ns&nbsp; | 29.31 | No Reading<br>
&gt; &gt; FAN6_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 3Ah | ns&nbsp; | 29.34 | No Reading<br>
&gt; &gt; FAN7_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 3Dh | ns&nbsp; | 29.37 | No Reading<br>
&gt; &gt; FAN7_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 40h | ns&nbsp; | 29.40 | No Reading<br>
&gt; &gt; FAN8_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 43h | ns&nbsp; | 29.43 | No Reading<br>
&gt; &gt; FAN8_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; | 46h | ns&nbsp; | 29.46 | No Reading<br>
&gt; &gt; PSU0_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F5h | ns&nb=
sp; | 29.60 | No Reading<br>
&gt; &gt; PSU1_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F6h | ns&nb=
sp; | 29.61 | No Reading<br>
&gt; &gt;<br>
&gt; &gt; real&nbsp;&nbsp;&nbsp; 2m43.704s<br>
&gt; &gt; user&nbsp;&nbsp;&nbsp; 0m0.046s<br>
&gt; &gt; sys&nbsp;&nbsp;&nbsp; 0m0.057s<br>
&gt; &gt;<br>
&gt; &gt; The cause of this increasement is when it failed to read one sens=
or<br>
&gt; &gt; phosphor-hwmon keep trying to read the sensors with the retry is =
10<br>
&gt; &gt; and the 100ms delays between retry times.<br>
&gt; &gt;<br>
&gt; &gt; Should we reduce the retry for non-functional sensors?<br>
<br>
When a fan is unplugged, its &quot;Present&quot; property should be false a=
s well.<br>
Maybe you could check that property and skip such fans?<br>
<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Regards.<br>
&gt; &gt;<br>
&gt; &gt; Thu Nguyen<br>
&gt; Hi All,<br>
&gt;<br>
&gt; Any feed back on this?<br>
&gt;<br>
&gt; Thu Nguyen,<br>
&gt;<br>
<br>
<br>
--<br>
BRs,<br>
Lei YU<br>
<br>
<br>
------------------------------<br>
<br>
Message: 3<br>
Date: Thu, 24 Dec 2020 09:32:14 +0700<br>
From: Thu Nguyen &lt;thu@amperemail.onmicrosoft.com&gt;<br>
To: Lei Yu &lt;yulei.sh@bytedance.com&gt;<br>
Cc: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: Re: Phosphor-hwmon: reduce hwmonio::retries when sensor is<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nonfunctional.<br>
Message-ID:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;2c526c72-bcad-4751-d18b-3b07=
ffd12964@amperemail.onmicrosoft.com&gt;<br>
Content-Type: text/plain; charset=3Dutf-8; format=3Dflowed<br>
<br>
On 12/24/20 08:52, Lei Yu wrote:<br>
&gt; On Wed, Dec 23, 2020 at 11:33 PM Thu Nguyen<br>
&gt; &lt;thu@amperemail.onmicrosoft.com&gt; wrote:<br>
&gt;&gt; On 12/16/20 14:33, Thu Nguyen wrote:<br>
&gt;&gt;&gt; Hi All,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I'm working with Fan sensors on Ampere MtJade platform.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; In this platform, I have multiple fans which name as FAN3_1, F=
AN3_2,<br>
&gt;&gt;&gt; FAN4_1, FAN4_2, FAN5_1...<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I added the configuration for those fans in phosphor-hwmon and=
 I also<br>
&gt;&gt;&gt; added option &quot;--enable-update-functional-on-fail&quot; in=
 phosphor-hwmon<br>
&gt;&gt;&gt; build flag. I'm trying to set fan functional to false when unp=
lug fan.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Flash new image to the board, read functional of fans. The tim=
e to<br>
&gt;&gt;&gt; read dbus property is about 0.05-&gt;0.1 seconds:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; root@mtjade:~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b true<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m0.078s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.002s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.032s<br>
&gt;&gt;&gt; root@mtjade:~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b true<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m0.044s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.034s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; After unplug one fan (FAN4_2), I can see that fan functional o=
f FAN4_2<br>
&gt;&gt;&gt; is set to false as expected. And functional of others fans kee=
ps<br>
&gt;&gt;&gt; true. But the time to get dbus properties of all fans have a h=
uge<br>
&gt;&gt;&gt; increasement event in the working fans.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN4_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b false<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m1.189s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.001s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.036s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ~# time busctl get-property<br>
&gt;&gt;&gt; xyz.openbmc_project.Hwmon-1644477290.Hwmon1<br>
&gt;&gt;&gt; /xyz/openbmc_project/sensors/fan_tach/FAN3_2<br>
&gt;&gt;&gt; xyz.openbmc_project.State.Decorator.OperationalStatus Function=
al<br>
&gt;&gt;&gt; b true<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 0m3.285s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.010s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.028s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The &quot;ipmitool sdr type 0x4&quot; commands is also failed =
because this<br>
&gt;&gt;&gt; increasement.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ~$ time ipmitool -I lanplus -U root -P 0penBmc -C 17 -H &lt;BM=
CIP&gt; sdr<br>
&gt;&gt;&gt; type 0x4<br>
&gt;&gt;&gt; FAN3_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 25h | ok&nbsp; | 29.13 | 5100 RPM<br>
&gt;&gt;&gt; FAN3_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 28h | ok&nbsp; | 29.16 | 4700 RPM<br>
&gt;&gt;&gt; FAN4_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 2Bh | ns&nbsp; | 29.19 | No Reading<br>
&gt;&gt;&gt; FAN4_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 2Eh | ns&nbsp; | 29.22 | No Reading<br>
&gt;&gt;&gt; FAN5_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 31h | ns&nbsp; | 29.25 | No Reading<br>
&gt;&gt;&gt; FAN5_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 34h | ns&nbsp; | 29.28 | No Reading<br>
&gt;&gt;&gt; FAN6_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 37h | ns&nbsp; | 29.31 | No Reading<br>
&gt;&gt;&gt; FAN6_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 3Ah | ns&nbsp; | 29.34 | No Reading<br>
&gt;&gt;&gt; FAN7_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 3Dh | ns&nbsp; | 29.37 | No Reading<br>
&gt;&gt;&gt; FAN7_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 40h | ns&nbsp; | 29.40 | No Reading<br>
&gt;&gt;&gt; FAN8_1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 43h | ns&nbsp; | 29.43 | No Reading<br>
&gt;&gt;&gt; FAN8_2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; | 46h | ns&nbsp; | 29.46 | No Reading<br>
&gt;&gt;&gt; PSU0_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F5h | ns=
&nbsp; | 29.60 | No Reading<br>
&gt;&gt;&gt; PSU1_fan1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | F6h | ns=
&nbsp; | 29.61 | No Reading<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; real&nbsp;&nbsp;&nbsp; 2m43.704s<br>
&gt;&gt;&gt; user&nbsp;&nbsp;&nbsp; 0m0.046s<br>
&gt;&gt;&gt; sys&nbsp;&nbsp;&nbsp; 0m0.057s<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The cause of this increasement is when it failed to read one s=
ensor<br>
&gt;&gt;&gt; phosphor-hwmon keep trying to read the sensors with the retry =
is 10<br>
&gt;&gt;&gt; and the 100ms delays between retry times.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Should we reduce the retry for non-functional sensors?<br>
&gt; When a fan is unplugged, its &quot;Present&quot; property should be fa=
lse as well.<br>
&gt; Maybe you could check that property and skip such fans?<br>
&gt;<br>
In the sensor Dbus object, we don't have the present property. The<br>
present property is belong to the inventory object of the phosphor-fan.<br>
<br>
If using present properties, we have to map the fan sensor name with the<br=
>
corresponding inventory object. We will break the generic character of<br>
phosphor-hwmon.<br>
<br>
As my opinion, for hotplug supporting devices such as fans, we should<br>
not retry when failed to read. Because there are no difference between<br>
the fan sensors are failed to read or the fan sensors are unplugged with<br=
>
the fan.<br>
<br>
Is it reasonable to retry to read the failed sensors after each 0.1<br>
seconds?<br>
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Regards.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Thu Nguyen<br>
&gt;&gt; Hi All,<br>
&gt;&gt;<br>
&gt;&gt; Any feed back on this?<br>
&gt;&gt;<br>
&gt;&gt; Thu Nguyen,<br>
&gt;&gt;<br>
&gt;<br>
<br>
<br>
<br>
------------------------------<br>
<br>
Message: 4<br>
Date: Thu, 24 Dec 2020 18:47:23 +0300<br>
From: Andrei Kartashev &lt;a.kartashev@yadro.com&gt;<br>
To: jason.m.bills &lt;jason.m.bills@linux.intel.com&gt;<br>
Cc: openbmc &lt;openbmc@lists.ozlabs.org&gt;<br>
Subject: peci-pcie CI issues<br>
Message-ID: &lt;6c2c44435e704f6eee95b7e35cbc39ccfae32b62.camel@yadro.com&gt=
;<br>
Content-Type: text/plain; charset=3D&quot;UTF-8&quot;<br>
<br>
Hello Jason,<br>
<br>
I push several patches to peci-pcie repo, but looks like CI broken<br>
there. Could you take a look on how to fix CI?<br>
<br>
[ 90%] Building CXX object CMakeFiles/peci-pcie.dir/src/peci_pcie.cpp.o<br>
In file included from /usr/local/include/boost/asio/execution.hpp:19,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/system_executor.hp=
p:20,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/associated_executo=
r.hpp:22,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/detail/bind_handle=
r.hpp:20,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/detail/wrapped_han=
dler.hpp:18,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/io_context.hpp:23,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /usr/local/include/boost/asio/io_service.hpp:18,=
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; from /home/jenkins-op/workspace/ci-repository/openbmc=
/peci-pcie/src/peci_pcie.cpp:22:<br>
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info&amp; boost::asio::execution::detail=
::any_executor_base::target_type_void()???:<br>
/usr/local/include/boost/asio/execution/any_executor.hpp:811:23: error: can=
not use ???typeid??? with ???-fno-rtti???<br>
&nbsp; 811 |&nbsp;&nbsp;&nbsp;&nbsp; return typeid(void);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; ^<br>
/usr/local/include/boost/asio/execution/any_executor.hpp: In static member =
function ???static const std::type_info&amp; boost::asio::execution::detail=
::any_executor_base::target_type_ex()???:<br>
/usr/local/include/boost/asio/execution/any_executor.hpp:851:21: error: can=
not use ???typeid??? with ???-fno-rtti???<br>
&nbsp; 851 |&nbsp;&nbsp;&nbsp;&nbsp; return typeid(Ex);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; ^<br>
<br>
--<br>
Best regards,<br>
Andrei Kartashev<br>
<br>
<br>
<br>
<br>
End of openbmc Digest, Vol 64, Issue 61<br>
***************************************<br>
</div>
</span></font></div>
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

--_000_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_--

--_004_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_
Content-Type: image/png; name="SSD.png"
Content-Description: SSD.png
Content-Disposition: attachment; filename="SSD.png"; size=33407;
	creation-date="Thu, 24 Dec 2020 17:06:53 GMT";
	modification-date="Thu, 24 Dec 2020 17:06:58 GMT"
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAxwAAAEzCAIAAAA0AJKVAAAAA3NCSVQICAjb4U/gAAAAGXRFWHRT
b2Z0d2FyZQBnbm9tZS1zY3JlZW5zaG907wO/PgAAIABJREFUeJzs3Xd4HNW9N/DftO29adW16t2y
LffejQ2mBNOTAAkEUiCF5Ca5bypJLin3JhBSCL0ajAsGueAi2zK2ZVnd6m1XWpXtvU97/5CLbOQG
ohjO5/Hz+NHOzJmzM2vvV6cNNjxspWkGwzCRSCQUCgmCIAiCJEmGYRiGIQgCx3GO43AcxzAMkGsJ
f+Zv9jOtBoIgCIJ8KZCJeJwSCGmaDgQCDMNgGCaTyRQKBUmSOI6Pv0KSJEpU1xoegAUWuPFsxV92
fwRBEARBPhaM53kA4Hme47hwOBwIBEKhUCwWMxqNGo1mPFeRJMlxHMdxn3VtkSvE8SwbCASi4SDP
cShRIQiCIMin4HSoGu/gG3+JYZhgMGg2m7VarcFgQH1/1xqe59lIKBIOBYwp6ZRAgO4dgiAIgnwK
Tgeps4kKAEiSVKvVZWVloVDA6XCgRHWt4YGDSCio1ugEQuFHuHfRSPiTqBaCIAiCfLHhF9tAUVRW
VrbH4wmHQ59mhZCPb7y7DyeIj3a4zTo0hZVBEARBkC+Ji4YqAJBKpekZGWNjIzz/eR9NFYlELJZB
mqY/64p85ngAjgce4PN+yxAEQRDkC4ZYe9364dHRtNTUSTeLRCKPx4NhIBZLLl3Q0NAQhmFCofBq
a+D2eGpP1H1w9PiA2UxRpFKpDASCe/dVp6YmCwSCKymBYZg3Nr31+htviUUikylrYlfmlxHH8zxE
IyGxVCYQnHc7wuHwwMBAb29vU1PT0NBQJBLheV4ikVzQRehzu9Q6/YcLjsViR48e7ejoiMViWq32
y36dEQRBEOR8BI+TRqOhuLBw0s0YhpEkZbPZNRrNpUfnDAwMjI6OKpXKK89VDMM0NTc/9Y9/d3f3
eLzewSHrB0ePjwyPymTSZ559fumSRXK5/LKFBIOhLVu2nWxsMmWbTp5s4FguKyuLJD9iz9cXAT95
qLJYLM8++2xTU5PZbHa5XFar9dSpU0ePHmVZNjc3d2IBk4aqUCi0adOmuro6l8vV0NDA83x2dvak
HwkmGqh+t4rTZWik5zJx2DnY0udONWoAIOodae22GfQaHP8oY/XinqE9++sNpgwRgY807a0bhowU
zeQl8dxY17Fde6pPDbq1xkwybD1xuPpgzYnWjh4qKVcvIz/C2ccFLc0/ePR/0hcuTpJePPeziaon
HnrdlrysZPLfWD46LtJ6eJ8FVOH26s3vVreeam1qampq6uZ1qSlywtbXsHPXvrrGlq6ubhcjMyWr
2Ji34fDuQ0eONzW39fZahcmZGjEJwAfNDbsbHBp2aMehruzi7PF3MlZXtbczaso2UldbK54PuYca
ag4fPHK8sfXU4JhfrNGrJFdUTMwz3NJh06VoL//vlou2H9rZFtWZ9JP9msez7TU7+xNKe937Tspo
VInPbhk7ta92kMtI0RJogCiCIJ8YsnLm9A3r119iD6lUiuNYIhEXCkWX2K2wsLCrq6uzs7OwsFCp
VF7Jubt7ep974eXKmTMWL1yQnW0KBAIfHDu+472dNoedYVn+ChYCYBhm89tba+tOfu2eu+bMrnzn
3ar3du0mSXLNmpXERx1R9EVls9mGhoYeeeQRoVAolUrlcvno6Oj777/f2tq6du3ayx5uNptbW1vv
v//+vLy8HTt21NTULFmyRCSa7CPBc5FwmGYn9j/yEa+1uZ2eNS0HAGKBsZY2V0lxLvmRvt98bmuY
lEsIEiBuNjsk5XMuVgzPMt0t7crSFYsKUkXC2KGt+3zKsuVr5/PxACn6WM1sHBN3OlwJ9tJ9rHzY
6/CE4h/nRJNiwv5Be7RsOhXqD4tTZ25YnAMAALhYrojau/YeaM5ZvDpPL436HT5eBEBbGw+eHBGt
XHqdSsD5nU5qPIHyCevQMKWdRdD9oVD07DthYuFQJPERVuGgI2P7qnYzSaWLV8+RUMxYv9np8Wdo
JVdyjxNeW1O7o2Bm/hU0TfOJaDiamHw9W46NWEaC2flyTyTE0+fdHTYRicRptLoIgiCfKPKrd99F
UZf6bZLAcRIwhmYu3QIlFouLi4vb29s7OjpKSkoUCsWlT8zz/P79B3Ra7Z23b5RIJABAEGRZaYnD
4Thw8PCVVD0UCu/Y8d7JhsY7bt84f94cgiA2XL+OIMl3d+7iOHb16pVX2Hv4pWIwGN544w2FQnHf
fffl5+fX19cPDw9fyYGRSCQajZaVleE4XlxcfPjw4UutW8YnbP0N3TUjfkZYsXRNiREajjfYR7lX
Xx1WZ5cKLXVj1uibmxyarBnz88nDH3QZFMIxr4+UJ89dNC9ZTrrNrbWNXd4wI5CpF6y+Pk3ORwJe
hpQpJAIA3m616lLmkwRwwaGxqGx+MvfBu9s1s9cVqeO1728Zki+8fVl+cOBItVmQRroazQ7Sf4jz
V87NjvYE1MsWZQsJoORpSvl5n/mRgy8+9lr/gvzE4eNdhlk33r86q+rFlxuHgkse+OWD66cd/ef3
90tu/uM3luEYtO5+8unj6l/eng9s4Mjbf/tHTYNXnPHNn/z3dSVJfMx5aPNzL1UdD3HSmWvvfuiu
VR++MHTUcXTLy8+/dzwYJ0sW3fOjH20Q2E69+s+/720bJZX5G7/17a/My/UdeerhF+0VWYkTdb2G
hXd+f4X87ZffaBjGV93/o29fX07iWNBvi4l0WrEgBECKlWqNZjy4YBh4g4EIL802pepFFKbXZwIA
RDxuvzK5JDM1SUjihuTTzWZsLGh1xU1FCnBNegs5W1fdiZY+X5wXSlJWbFiqp/ix3qaTzb2+BKbL
KFgwe5pSFD9e9Z5HkIaFx6iUkmym0ybIvmXJvCQJAQAGfQrDAXC0a7D1SF1nkAZ9WtncOSUqPHR0
34GENilqGwkkyLwZi8syZO3N9bbh0NuvusXGio1zVbt3nlDkJHksVl3J6uk6z8Gaek+EVegzZ8+f
nXy28ZqjB9uO154ajHG4PDV/6bzpGjHJ+PoDhD5JKw5JpALyvNxMUGKxkEKtVAiCfKLInbv2XPCS
WCxevXKFSHQ6Q+EEAQRxwTdoJBJxOBwf/loViUQ+n6+9vf1KclVTa9tdd2wUi0830e89UL1l6/bx
MoVC4WWH7Gx66+3DNUeKi4uWLl443i4lEoluvH5ddfWht7dux3Fs3brrLl3ClwqGYRiG8TwfDAYn
NuNdydCotra25uZmANi9ezcA2O12juOqq6tnzpyZnJw8yQExj9VXuGr5moCl9kjNibRbVpZVTrM0
JDZuXIyTAm9S3MK4brp5uUQsDLvaHQN9quvuuGm51ly3p+ZI03WLixvrGsX5Sxdma6J+j5AE4LmW
vW8Op6y+dX4uxgeGx1hTiQEH3m220Jpsg1ThIILWEXuWGLOPuu2CwfDSnLHeIZAvLJ1e4rAMK+eu
nZWT5Gt4NxBwNB6pJlg6GKPmrb6+JFV6tr50yNNRe6hi9eO/XLby/3794++fXPBfP/nJOn/Nj//y
p1llz2WXFp3883uOe5cYydjBrXv0S34pFGDgam8J3PaD397csvWPz/zr7co/f9O6/cnH33D86Je/
L9KB00dP+gXevvsfv9rU/8jPfl2RhI+M0DgfqXryF7vcC/77t48Gal98/P89btr8YmbY/sHR47PX
/vrx5fbfP/bET4bWPPS1n83rfPM3f//3zSueTJcKvNZBqaFEROEA4LU07ts3iAEAqSirnKY3pKVL
Wqq27jSlG9IysrLSjSJSlJmXV7t/3ztRS7rRmJ5lStUrcAyiQVeAUyXLJNykoYqL1h1tVleuXZqp
CHtCQgyLj7XvOdxesnjFAiXXWnPoaFvSdZXKkMc+Kkm6YeV1GjHbWHVUk1yskZz5aGE4SUDY3r1n
X2PB4rXZWq6+et/BBuH1M/ThgHUMS7txzU30cMPOutqM5LUFpdNOBRwbNq6RESQeGfJ7B+KxspXr
K4mIu7rqkKhsybosZU/d/v2HRBuvKxkvng8OHKmzFK1emyPH/eGYiMAAOEdPvyClUinASxatwgSy
iW9Ilzd/Hk+RKFUhCPJJIg9UH7rgJaVKsXTxwrOhCsMwDMe583vjYrGYzWZjGOaCY8cXXo/H45FI
5NKhiuf5eDwuEonOjstZuXxp5Yzp4wsCEDih02kvfbjN4RBLxDiOEwTx5/97yul0lpcW33P3nRiG
yRSKoZGxy7/7LxO5XC6VSiORyNmRavF4PBQKGY3Gyx5bU1MzHqp27Nhx9sWqqiqFQjF5qBKoSqYV
J+s1OmnJida6cJQVUyRB8uPdhQKKJAhSJBIJKDwCQGqyyrMNAkqQXlhy8r1T4WihVIQPjw65DBKd
NkUhAsDw8pW3FVFyDIB2dLup1LlaEbAh85A3uXAWBURymrZrxO5Xs5ixOCvksbpdw854SkmKgOJJ
kqAEQgFJMizL4aLSOWvzDbj52K7aujbTzXMmjspR5cy94yvLMvnA8rLMgPLG9fNL2Zih8OltLrd/
XsXiuYLtWxqDDyYfPWjRfvfnFQKuFZT5d959/bQstebGVW/9pjnodn9wsK7o7sdvWFCGAeQBADtJ
x1/9+0eKN/z0+oXlQgxy8gHCrdV1vvW/+8acMg3k3Ld728M1Le6vAm6atvyW9YuyJY5FRU83ld+2
bm5JTL869dX/tTJMOk9bh8PGOSnjoY2SKIxJSQAAhERMEaQ4dflNGwfN3eah4Zo9jfUZ8+5YP1OT
P/tWmdFqHhzoqm+qOzlj/a1zTSr/2ACpzxCLiIssSoZLRDA6Yk3T5euSDHKKM/f2MOrcTJ0Uw/is
TP2hgcFYZTlGik15JUkqKQYRmuEx8sLQ4rUNJtSF5XlpQgKrmJ5bVT8cL9MAyPNK89USYdyYI2Mt
sRijIimcoIQikRCAB8BwZcm0fKUE8zrsY2zSHWW5CgEhmFbRvas9EM8fLxkjxRKKGbVYtbmZeq1B
TBHAuPuGopnL0wgAiezCEQiUWHbVo8QQBEGuEvnvfzx56bYKjmV5hiHO30ej0cydO/eCPXmeN5vN
VqvVZDIljf9Hf3EYhpmyMts7OhbOnzdeAZVSqbqywVjjh//iZz956ul/RaJRAGjv6IhEIkLh6f6+
FcuW3HLThiss6ktCq9WqVKqenp6ZM2e2tLQAgN1uHxwcvOGGGy577IfTM5wJ0JMfQIgkJAkAgJMk
xvPcpYayYBRFYDgAYDjFsQxPiiqXr5N3dHacqHYGYO6aW0pSxFKVDgAA6OGuQWXWQhUJCZ/PGiLn
JIkBQGrM4lv7R/pjorTZGd7ageYuV0JebqQAEmfPIpVKpQpxklEpEkJ6mv7wMXeYBcmEcXek1KAg
ARiMJMUalXI8sVAkn2A5UlPw1VuKfvrKZkPqB3jljXOyxNwAgEirFZEAQAgEFM9yDBuNcCq19NJN
IaFQQqlQnBtWnwhHWEIqlWMAIJLJhFg0FAcBJhLJBQIMMEIswmUGPQGAkwROQAyA9Q1Yac1KoxQg
BgCypLxp0/InnkKs1BZWzC+s4L3mhje3nRhaMTNbJDCk5RrScmfMj3ZUbz12sr3CNNM64EkuWyjE
IY4TGEMneAAMAPh4gsEpCsdFC9bd0N3Z03p0vzdCLd6wLk7Hg/b+o4cd42dJS1YAAIbjlECAAQAI
jWphr9cV5XLlE/6rYOg4TukIDAMAUijmaS/P8QCkUEAAAIbhBM9PNnxSJBRjAMBwCQ4XCXAMAEhS
TECCOfuRk2asXresra23qaYjgGmXr12mC48Ns9qbdGgwJYIgnxn8ZEMjf8kx4SzHMRxLXG4+Hcdx
Q0NDIyMjmZmZaWlpl13IG8OwZUsW1Tc0tbS2JhKJ8RJsdvuW7duDweDVvg0AmF5RLrr6BR2+PHQ6
XWlpaW1trU6nW7lyZSwWO3DgAEVRhReZ+Dm1MIzgmQTDshzPY0AAy9Asy3E8ANDekTFfkGHogGMg
IVaKhCQmUBTNXLj2unWl6linxckCJGLhaILhY74+G52dq8MBgt4xWpqkFAkAQCTWSdjRlgF/UkpK
crpu6FRzRJGiPX9unzwzS0z73N4wQ0cdNo9AoZTgwCaikdiVDMomizbcLqh96rdvDN1wxwr5ZL+D
4CJJXoG+vbreE4rGY9FwKDJhFDsXDXg8wTgPUFSW3nKyweGLxGPRUDDMKrIKdVxbfX0gGvV0NbX7
qJy8SzXQArDO/iGBMUd/Zrggz7HMGSzH09FIIBiMJ2iGZngOIwgSw9hQwB+OxGh6fBcCIygIWUci
8tRUOQYg1apFrNdqC9M0nQjbLY6QOskoAB4TaUtmL7pu3YoMobdriDbo9UpN2vyVa9etW3fd2tUL
KgvE51WMSCktZYc7eyz2eIKm6UTI6xzzBmWqJMY15IvEGCbhGh4iNWqSmuR/EpzAgU0kmNMfibMk
Eq0kbhsORBmG9rqscUovOzMAlOcYUp5SuWj52jUr1NGRYY/fYbcJUzKlaKEPBEE+O+Q///0f4SPf
rZhWfrE94vE4y/EXrHj0YRaLxWq1ZmdnX0miGjd3zuyR0dGn//WfimlluTk5kUj0WG0t8LB4wfwr
WUxhHMMw42t+NjW3FuTnxWIx9ODnSREEsWrVqv7+/ldeeaWysnLv3r2jo6O33nrrZYe+TQmZOkkH
nTv37jOkl0xP0RvI5n3V+5LSivK1QAq4jmMHh6S40xYoXbBGhkcb9lfZWbkAT3iCsumz9QTP1lW9
PJyy+rqshBPTzFcQAOAaHFQYZ4pIDABIidSowfsGValJArHURAaPqjLSyPPXP8VVhQsLuk7ufbdH
gnmC3Ky1FVIMhk5u2+XOvmfdvMvWH1fPv34WVde34PrCizSmkvK1X/9e/a9+/81vHU9XC+XplQ99
6/Yz2wLbf3v364JHt/9h7dy7fzDrF79/5JGWNKWQUpT/8PEH7n70jsf+8JtHTmTGbIP61Q9vKBKH
By9eDzrYOxzMrEw5G0w8fcer4t3jNUifviCfsO07fIIWykUEHvC4VGXzM4RMf+Ox431ehVTCJcLu
MD9rdUHEfDKhMxnFGACQ+twF5UOHd28bUMnokDcuzV5fagTOc+TdvWGxjOISroR6fpZMJ5tbPLL7
4O7dcpkYY6KK7HmLys775EiM5asXeD84uKtbrhJTTCjE5M1ePiuzcHqWpWpHlVbGeQLknBVFInKS
FXrFWkOyoHnf7n16Y/7SCe1uUn36/OkDNe/taNdIfJ5g+bzVMuHpt856zXtrWjGBBKODAUn6dIV4
pM2VVliOBk0hCPIZwv721N/VGvXX7r77YnsMD1tjsVhaWvqlC2poaNBoNJmZmVe1JmQ4HD5Z33Dk
6HGLZVAskcydNWPJ4sWpqSlXWMizz794vLYuLS21t6+fZVmJRJyelmYdHr7z9lvXrJpk7tWXAA8c
y3K8x2nT6I1S2YXZ1G63Hz58uK2tTalUrl27tqCggCQvXK7J3N1pKiia+MqmTZtOnDhxwW4CgeC2
226rrKy8sAYs43a6JBqdREDyXMxh9yt1BhHBBrwudyBCSXWpOmnI53L7w4REI2GG3q0eXL18JkMn
SLHcoNeSwIZ8Tl8wxvCYWK4xaOU48H7naFygoUfq6py6DYtLCCx6aPt76tk3TEsdby7hQh6nL04m
J2sxNuEcGaO0yRqpgOc5r8NGKvUKEQUAbCLicblCcV6s1BjUMhzDYn67mxYZtUrabe2y86UlGSTP
2s1dXmF6YaqC55je9jZVZpFBLmDZxH++fV3rjJ8/9a2VFAZMNNDVM5xZVCAXEPGIo2fAn1uQI6Yg
6LB09g7HONKQkZudpvOZ233SjPxkqb2v3Y6nl2ZrcJ4NuUa6eociDKZLycnLNZJsbNTcZR71k1JD
XlGOViJIeMwddqqoME2I0WPdbSFNcZ5eyMX8nV1DulRFXU3bnOtWGyQUABf2upze0JnsiMn0KXoJ
HvB7/YEww2MCsUyjVUsonIlH3B5vNJbgMUqiVOkURNuhfd70RUvzNeNHckzc63QGYzRGClVanVIi
AJ71Ox3+SIwFQqzUGFQyHAMmHnK7PJEERwqEKq1eLsK8Dgcm06skpz9CPMeEfR5PIMwCLpGrNCoF
RWBsIuiwe2IMyFQ6jUpK8LTH6abUOrmA5Fja7fTItToRCSGvy+ULg0iTaRA6HH5lslE0vvIDE3PY
nZEEK5KpdFolhXFBjyshVGvEvMftCUViPEYqNDqZILL3vSOly9dladCcXwRBPjPYpfv+IpFIR0d7
YWEhSX4eR3l6PJ6q3XsikejEF5MM+pXLl115W9cXy2VC1ZX4cKj65PjGWrfvH7r5K2vPfjF/Dnks
DW8+/9Q7p+S/+esf55mklz8AQRAE+VK6VKhiWbavr08kEiQlTTbDC/k8usZCFR0P2l3RJKOe+hwv
dB12DzY1dUszppXmJaGVjhAEQZCLuWjzAMdxQ0ODHMvqdYZPs0LIx4VjwPOXbYO8BJniSudgfnyU
UJ6W+nlvU5RqMxeuzPysa4EgCIJ83k0+dInjOLPZHA6H09LTcfS8l2sJBoBhgJGUIBIKfbQi9Mkp
U1snBEEQBPkyuLA9g2EYr8djs9tEQmFaWjp2NaPOkc8Hjuc4hmVdzjGhQCwWS65wMiaCIAiCIB8H
FgqFpFJpIpGIRqNer9ftcolEAp1er1AoMQwlqmsRDzzHsjzLsbFQkGUYFj1FFkEQBEE+eVhLY2M4
FhNQlEgokCkUWq2OIAjUtnGN44HnOI7neeABANjPuj4IgiAI8sWHRaPRy++FXHt4AA44ngfg+fEH
KiIIgiAI8gn6/C4OhHw8GAABOGAAGGqpQhAEQZBPHgpVXwZo/iaCIAiCfOLQUHQEQRAEQZApgEIV
giAIgiDIFEChCkEQBEEQZArgABwAAEvjnAWAO/0jMjn+7PVhGRrNqUMQBEEQ5CzCOP+Hb/ZRo3Tf
DP0mPIrzhBGwqRy9HvE5QwwlFnwux0pzMafTT4ok5BU12HEcx0Wiwb6BphMtVZ5gp1aeTgkklzqA
jbncAUokIvDJ1/3i6JjTExCKRfintTAYz8RdLp9AIpny5xdz8ZDTGxFKRZ9C4+d4mEVrqSEIgiCf
K0R+etbL4Rk6TcP6lAaS7wVGzlPpE7sFmajvVP2Rw0dPNLb1jHrDap1RIpjke9PZ39BoTaQmqXAM
7B3HTrnwZL0CB2je+VxtKK0kQ3WV37XsaFfDgYNH6lo7LGN+iUanxAO1NXWsIUsluMyRfDzYeKw2
oTaohNRldg01//Z3bxvnLDKKL1Mk8BCNhBpPHdx/9K2Gnl2UwS9S4mphlkyiO7uTq+vY8cFEmlFD
YIn+k4ePW8JqsWfLpkMphSVK8eSZMmTrfXHrwaLyEgl1eodYcORgTavWmMx5+qv2vF/b0Nza0euj
Kb1WIyAwAHD0Ndd88EFtfUv/iEuiSVJKqItlCzrmqdmx5VBDa3Pr6T8tp7oJin/uyVdzVi3STPUD
iKI9+377n+MzVlTKPryN5ywN1W1+SYZ+ko1XieeB5zl+/G8Mg4uFq6jTfOBYV1JOuhAAIGE+eag9
pM7QXeZOf5ivr3bTzoNnr2Fza2uPF/LSkshJgnK868ie92pOtJw61TPoJJUGnexyH9bJcEyi/sgh
Tm5USiZ8gPlI27GDuw8fa2pt7x12CuU6tVx4JbEy6ho+VNednpFCoBV9EQRBPmH4dXCimOjoGtOH
wlGMp0niGM65z25mQsOb/v3XTUd7haqk9GRV2Np2qLYzBgAcEw54bXa7w+1LsDxwid766qpDjdYx
RyDg66x9f8+xlmGHMxRj8uZvWFJswDjW7/OGgn6nw+F0+2kOAIBn6YDXZXe4/KGgx+NPTOh4DHQf
+Ntz77gpbYZRy3lGR73hmNey952qRovN5vAyPBsN+R0Oh93hDMZoHoBnab/XFwz6nA6H2zFYvfO9
+v5Bm8tHsxzHxP0el83ucPtC4w9s4dnE+HkDkcTlO/A4jmXpgcG2TVVP7fngTbu/P3uaWqoUxukE
yycm7uhoP7S7ticSDTS9v/nFqkalIUmhzFy3YbleikeDvlCMBuDCfo8nEOUAEtGgLxQTa9NuWr9c
LjjXNBj1W3fuPOgJ0eGRjqr9LRqTKVVN7XvtmXcaBoFnhmrf+sM/t1rCVFq6URDo37un1neJW0uI
DWmZWekpCUfrvhZ3Vnp6ZmaaQgAAEA8HnA6HyxukudNXJOTz2O12p8cfZyZcEp4Jer0RmgeeD7id
vkgCgI+HfIEoAwB0LORyOmwOVyASP30Mz0UCHofD4Q1GuIlXluf6andXt41c9mJf5lYA76f5k05u
8yCzycIcsXOuOM/yk3dYR+19O6oO+0//FO89vutguxsAuPG7b3e4/SGG54GNeb0BmgeOjbsd7gjN
As8EvN4oc/pISqrOTk/PSje07N9li8sy09NTZZTX5bA7nB/6/MTaa3Z3uMWmjPS49cSTT2/28QAA
iUjQ6XTYHe5gNAEAwDEBr9tmtztc3kiCBQCOifs8Lpvd4fGHWR5iPuf+995p6h50eHyJs88Y4sLN
B99rj6hzTGkJa+3fnt3qCtEAfDzsdzocDpcncnpXPhENOh0Ou9MVjjM8gHugdWvV/qHRMac/zKP+
agRBkE8SmckPK7z2uvDCP1NL/mv6PoWMxwRdINUDYAB0x6Edx30Zv/r5N5KEEw7iucHmvVsOtMd5
jIlEMhbcsnGBsr6pz+Jzbd3uqyxOPt5p7YszW1nnouUbQgeea0u995uLpP/41X9D/jyDMDFidky7
7ZEbpunMtdtf2NMm12ilVLi1i/32b38xQzN+AtZu7vOJ825av0JL4QAAPN17tMtiG/Hv3DKsM331
9pnHdu/qHArQtI9WlX/1zhtSE+a//89TbFapUUSotFjX8OjYnqrRjLI71s4dqtuxr9VO4HwkAgtu
/cbyYs3A8W2v7OmUajUiIuimL9lgw/OxeLTh1KGDJ98hSXLmnOIINhKNRUmhYNIOOzburt72Sp2F
uuvhh8uN0qCr/tnnDt/7yAPWPf/3kH4SAAAgAElEQVRq1q7/4WrtG3/6bZ1wyW9+dtfwzmf2MQu+
NUv47+cPPfbf30uSTtKoJlCkzl64MCnitJ3c3WT23JYXfun1A/Me+OPGcjUOALCMY5hLfEsSlLhk
zuISoCXhlnayaNnSpQAQH2nmGPfut97EAv4RR2zlPd9aU6obbjr41vvNDIXTdCxr1o0bl5WKSQwA
gPPt+uefYmt+fs+02P9971v+VY/99Wul+/7zx+HZP35wRmTrK5t7/DzBMIw45e77b0sBCLj7tr3+
ChuI+OOSDV+7d06W6lLX9qqxx5zcvlFeK2DzNWKcIDu84QN2dq6BWGnkKYy4su5ArrP6zU1H+iVS
sT/CLb3t/utSx/72xM4bfvLzTPfe7z365vrfP3GPyf/0/7y19KePz9cAAEiTC5YkFwAEm9/dZpo2
Z1ERvvetV5/aw0iJRExkuuertxXoROeKx6m0/JlLFmWOiNwHn/xgMAFy2vzG85utMQKnaVae9Y0H
viLoq/7X242EQkiQ8vlrblyQKzu5d3N1u5PE+UiMWLLxPpO3rmvU7jlQZRstXb9mdar8XDNnetGc
xQu1Q9LQ/r/XOKNxeajnpZc2j/BSkg2JTYu/cctSWdjy9mubOiMCMR+GpFn33b62r+3E2Mjwtm1b
jSUL71haIZjyfl8EQRDkDPKXbauOijMJte8t/8IbhNWz0+24qJnNnA2ECOiwxWzWFX41SQh0xP/u
S/97zBLVFay4//a5e3ZWG+bctbI8JeFpf/r5HRXT/mv5knLPaNF37l0uJkDlaMaxpd+5bZ4IoPrA
6TNxvKBw1spbZmXYjjz7l30nFpcu3rvrWMmab39lTrqrfvPJrsEJtSIypi8qPv7644//jykzq3zG
nJnFprzymUWZHbPu/e5SAwAbn7Vk3UwggQ5se+GZ+q5ZydnAMXTegutvm5GKBUbcrZaCe+5bka4L
jjbsOGJdevtdJUki26l3Xt9ZXWZa9f6uE8VrHr5lbtro8dfqepwXvTY8H49HDtXuONK4NylJU1Ke
IZYTCS8nJnEAXkhJSLggCSW6PtjuzV7x2GN3FxulE96NINOUsbPeHKmIDghMWXi/zRXp7XfkLEkh
MDdcXGjkxB9+9jMyHhiykbddnxQY6x6Jau8uUZ+NgTh5romLY+lwMETzIBBJpOJLdQyxdDx74c1r
TIqWXc/sPNk5PyXn3V2HTSvumJ+t91tbX9qxd15Fbp5eDABAaKaVGja1tQeSwkFJVmjMEvTomseo
VSWygQ/eqo9kPXjnfBnv2/vGK3ubHfcagMXw8lVfX5SKHdv6zI59DbMfWDFVX+A8QFcA22ZO3FUo
DXY1RYfcCrVqRUoqnZqyuTsqJMhlBh77UKpKeFr+52c/EwMAMA5zb+5tALR1x66mijt/sL5ca61+
9elt1TN/ur5QFerrc0o8vZqc5EGzzUW4nJLsIvXkNRnpObp3QPjIo99KlTK7//WnqiMdWTfNOHu5
eSZyeOvfrDUij83KmdaZBEzPnq3teNmDd0+XMM73Xnh5X8eSop4WNmfxQzeWCXGghBL/aP17tfbV
d9xeoBNaG7Zs23Pk0ftXzcw+Ov22+xYV6C44e83rTwzuJj22ESJ7rUHCNby706Kc/5OvLcF95v/8
7aXaisK0oX31sbz/98iNEsb30h//VH2qeP281Vn99Q8//G059bkc14ggCPIFQq4XdcxJtx/yFPcO
GIjZNNjCkEKfHqeCYQRBsAwDAKRYvvbuR6c3b36ieixM2zo7rCS3f7SNBIDUsnw5xl72CYKEXG/S
a3GM1OhVXNQfZ93DAdlMU4ZIKEorLdYLhifuLEwqe/RXj7vHLH3dHbte+9vRWV//+Tr52a0x3+iB
d7YMBEghwZsHXaXhAA8UKTLmZ6tJDOMmfLfGnH0DZiu25516CgAgPz+JZ9zDYcXcnAyhUGQqKzVs
P3yxCnMcW9vwfk3jLqkmlluu4Uifw+/isAhFCHBKIAWFRHhBSwyZmlNqJPr313Vmrp0pPzfyDE/P
yRHtPFDTTSuy50xnTgz2Hu12Sm/ISsEilwpVEn3Zt3/4TcHIqXer+0pTVbgLx4BluMkXSI96rVte
2dQfwooWrLtlWYX44g1wlDilOF8vIQldqoaxRsP+wOCQZeTQ7v5aEgA0mSbBuayIp5eXR19sPikI
GVd/xdR2pLpT65Zll8ljR/oGR82O7VsGAQCE+gIZDgAqtak4Vy0CPs+UuX3fWAJAeJE6XC1PnHux
O3xfgUjL+yUFOb//w9sHDxyWLPzKqz//2jdLjX9v8eXJJOnSC0MVpch/4AffSQEACB1+8a9dAOAf
dnL663IzxCLIL88n99e5Esryct07XSfi9vDqr6xurD3VwIdURXPVF8mDIduIMLUgWaMQkVBaklxv
GUuwIDwTbjFCNHvNvd9YpKnd/a5DXyLDQt1dgyO2+LbNXQAAqtQskbB08er6t/Y888wxRVLGklVr
tY5es3nw4K7ttSQAYLl5evzizY+zNjx430zJ8fe323UlMpy2jXpTZ5VopCKgUnKT8RGnVzTq0BYs
1MnEwAuKc2QnHF7+IukQQRAEmXJkfnDE1kyDS3rnvKYiyofFhIyoBHABAAApzSsorNp3pNdXZpKT
YrlKKREQADimSdInFW24c8O0VACeZXmCJDtIguYYnucBMAwDluN4noeJfWQYnNfzgMnVgrDH6+NS
DbGxMT9z3sgYjqEZDtTGnNnGdMI78GxrP3PDTMDYBMfxPGbrazg+pv7FD++SU+ymx/8rxp0+ljh3
KmA4nueBVOj0KaZbv/qt0mQxcBzLYzi41OKYPxQBEMZ9Tv/Fl0UYtvad7DyUVhjT6IhQxMmxTiAx
UkjwgMnESi2TKZFd0JCAq7Jmf2OldvPrm1+gsQdvmnF2g0CfkS107TxMzVpdlhpPfu/gbq98ZpqG
gsil7g0ukKj0OqNmfmVv87v7mx5bm5qnCtQct2bOSxEQGM8yiThDyk4PZpZoTXd/5zGW5wmKoi43
Bn3i9E6BSKhRGmbeet+KXC0GPMvxJHFuO2Uo1tLb3q+RrPjZDE3o4Mv7GpJyFgsJsUGtSsqrfOjb
y+U4xrEsEGSiqyUcdtg8TLKKdXldpDJz0mkCPEsnWEwgIIHjaJohBQIc45lEAgiKJC5a7x53XCHE
kyX4jle3Yxy7cu36d/lkS0allZBWiolCrahuJJyeL7/gKIwU6wwGAwCAWCkWAABItWLe5/UEOJXU
N+JICNUyCgSm4uDBPY144aNziuwHqnc1kHNvNlysJkKVKuaxxxKMCAPbsEekUJ5XawwXy1T65MxV
a+b99R876+f+0KhTpWpXfPveWTIcY1kWI0jglPc/lO3zuE++/+o7B5K+PkunT829496H8vUinuM4
HgM6inEYw3L8hwbhi+UavVG/YtXSp5+rOjXtXrlS5Bm1M2wKF4063LRaLpGoZP4xG82W4GzCNhZS
mCQYJIDhT//LPFcSl0gwBEkRODA0zWMkReI8xyQYEFAkGtGOIAjy0ZD5nlBCAyvnjk2bHiPdJEuk
8dLSM2GIzF9y44bhl/71f3/OykqT4ZxvxFxYuEYl1t54S+XLW15zt2eJgKZxw9qb16qTM7nqE1t2
0BUzZqkyTf6qmm3vBmdULrzYiTFMs2ZlwWvbXnZ3ZgbGOhiWmjCbihtp3L/pSK9CrSC5UG/P2Jz1
1wvEuvxUYc3WTUFT9tyCdAPbdeh4nSI60jAaLzm/ZFwkM6VJj1e9Fy4oWzpzxvpp9Ztefq4kO4mL
hQSpszesKF29OGfH+++w1jRbT2OCvej8rIB/JN3kEhlZluEBeAwInqcAJxRCvSqYbCpahOMfbjLC
dTlzv/9d5Qv/efGvfv/tq84suCBIml2ifLXKc3dKcjqTPdr9RtLtDycJIHAFdwgjhLMWLqn+y5ba
Jb/45kN3/u+z//hTfVaqTsT43by28q67llCnrycmEH6UhiGRLvPGdXNfe+U/g0U5Qi4al6Xdsma5
VnL6rVFCXYGe32vV/yRTpphT1Le5av66u3FMUL7+5qy/vfH3p4dMSaKwO1x6/Z0VAPGwY+/bL3eK
obvTvfprGyeNSPbaN546of7hDzcIhjuffHbXHY99N0/JvvP3P9Nz7r99YebFUlU0FNEQAhElnr1g
4Ve++X35/JvS77pPefzAnjderfzuQ0li8LgCABeGqkmI825amPL2G89ZTeqBnr55Nz6YIYCooUAS
+Ie79OYsSer0HP6tGrgv5cJ+t7MyihbPOvrC0y+9ninydY5qNn5zumSySotSp904q/qFTUd+fMdG
zZNvPf3vrkwtFXSGZ912u6Dj4AlrRCzC7HYse64xyZSypqj1lRefL87SsZGwJGveuoU5mamSw/t2
hF3lc2fN0n2o1VFqzFteINq6s+37K1Y3vLT9qWiPJDQwbJx7Y366yrjy5HOb//qSS8dae4QV36zI
kTGWDKFz09tbc4tnLpuWezpwxy3/fOLVkrseW2Xiqt/4e3fyHd9bnR1o2fZENfe9h+9IudQ6IQiC
IMhFYYx0AZTGIBsjdBhnSKfXPsQXzYMJbRVsImQdtNg9IQZIuVqbnZkpE+I8Exu1WoZsXiCFhpSs
jBQNnggN9feO+JmU7Pw0JWbp6XbG8IzsYnF4MChKz9AQ5n6LISNHIaG40EjnKOTmpRJx/+BAvy3I
a6Dnn9s9j/76O7mnh/zydMQ/OGh1+UMskEp9Sk5GspjCwq6hjv7RBK6aMSM7YB0wOyNCsUotSmCq
1HQF0d8/bMjNVVIEABd2j/WYrRFCXVGUI+RDFvOg3R+hRLLUrOxktZSPBywDA64wptbLEiEuIz9P
MVmjSiziHzYfHvQdpMVeXEJiOInxQj4sTBPNzkhZIFUZLuiHC471WuPK/EwDiUHYZekeSWSaNM5R
f3q2SSrA4y5z8xhTlJ8j44PdPT2S9IpMNUVH/L1D7py8LOGZ5g465u3pd5pyc8iYs3s0mldkEgEA
Fxvq7eP1+Zkagd9uGRxxBuKsWKrKys7WXn7SPue1W0Yi8lKTHgC4WKCn35ZenCfFsLDXOuQV5GUl
kXxs2Nw/7AoCKdSnZGQYNecSLs+5h3sGAtKZJel43N3QOppekG9QCAEg5B7pt4yEaEwi12TnZskS
rs6hoEQcdzrCsqSMvIykc2Oied412OkRpOanKKNOc4+bKixMwyO+nr7R9KICBcVbO7tYnSlT/6EO
vDNq2m2nWME905Kf7wn/3wcNRgzWL5rltpsbf3zv359+2pZUGOwfvWORaeIhdNDZNejPKx3/TDFO
c49XlJmfLKVj/qEBsyNAS7TG/OxUMYHzTMzS2xFT5RYlK8LOvg47FOdnSy9cN4QZaO+QpOYbVYKo
19Y9MBJhiaTMnKwk5YQPAT3W1xNTmEwGCQAwoZG2wURufhbntQ4M2cIsJpVrc/MywDfWN2QLJ1ip
xpiblSET4nTEax4YdAajArE8NSvbqBKHndZeyygtUhXl5yuE43M1EsN9PbQm36QVAEDCO9I1lsgt
zIiOmQeG3ZxAmpGTm6QQ4cAFHNYei43GhOm5+SlqCc7RjuGB/hG3QJ9VkZ1y+oPGhbraLaqsQqOU
tw32BMQZ+UY57R1ss0NBbqYEPWYdQRDkI8Hct/5eNmgmpGx8SRF/z0YizQCAfToLK9rMJ47WDuEi
trPpVNLi++9dmfM5G0nLA8+ziUTQNRKM21k2LhQo5bJkmdoIOI+e8PNpaul1bB+O3bAg562B6GjA
N/bSEz//3e8aDuzt3r0jOSsz7caHc+KhVbNNly8IQRAEQT4xWNjuxjwBjMBAqwKJEODDAzk+KVH/
aE+X2R3jJKrkspIcKfn5G8rB8zDJ8pKf3iVCxkWiiT5PLNmoCsTZSCLuamusqKz0OOxBt4snCEFS
TqoYVymuemFPBEEQBJlCWDR62Xl7CIIgCIIgyGWgPiwEQRAEQZApgEIVgiAIgiDIFEChCkEQBEEQ
ZAqQB3ZXfdZ1QBBkgglPMkAQ5FqB4QSGYxz6l/vlhm3cuPGzrgOCIAiCIMg1D3X/IQiCIAiCTAEU
qhAEQRAEQaYAClUIgiAIgiBTAIUqBEEQBEGQKYBCFYIgCIIgyBRAoQpBEARBEGQKkFe3O4bLdOnl
02fNmlakU4g4NhIOhl0Oq2XQ3NF8yhagP5lKfjrEqx78wbIs2SRbOPrUgTe3HuxMfOp1QhAEQRDk
WnFVoQrT5i349rfvK0mRfbiBq+6Nn//lnb4pq9dngNCkmnJzlZNsYePOJilq00MQBEEQ5BKuIlRh
ouS1N28oS5EB8PGg1zYy6gmxQqUqLVknEAj4T66On7p4yDPm9LLcmZ+5hM0X4i51BIIgCIIgX3ZX
EarEKabSdAMAsAnnK7/7+X5zYDxICaTanKJyTcx3/u640pCamZGqUkgp4CI+j2Wgz+4Ln40mwqT8
RWUZABD1jZ5q6ZGkF5rS9AIm5gmFdXoDgUHE2VPXMnR6wX+cTM2tKMhQ4QAha3tt9xgAAGAihTY7
26RRyYUEJMLBYUu/1e5hzuQ7SpVaWVYgFeIsHWo/cTKmyCjMz5AJiIHmGovnEk8S4EYbdz7x3Hve
2CTbRMaChaXpABDxjrS19p6pdqiztTEqK6gsTSEA4q6hhq5BRUpedqpezHkamzu8YRoARHJdemZG
sk4pIPF4JOR1jvWZrbEz1cWFsoLSGalqAQAz2FJvjUly8nMMKqnf0tLY77zy24QgCIIgyGfiKkIV
SRE4Pt4JxjEcT5IEy3IczyfC7s76gxP3xAXykoXX3bJqTppRJxWLCODjkZDD2lPz7tadjf0sDwAg
zZ734IPrAcDRc0KlL120ZnmKQcW6LFXH2tesW6cSEV7LEVvv0wMRHgAIoWLxbQ/cVK7GOH/1c3+t
7R4DDM+cvuaW9YsKMpNlUjGFY0ws4h4bbKh+b8uhpnCCAwBhUuHGe+5LUwviwZFtmCx3+fUl2Uki
gnvrD7WXDFWXIs9Z8OCDawHA3nV8d1L5kjUrkvUK1tn3r+FWZ+aS+x9cJgTwtOwXmejly+amaZWU
p/G3gwPeCG/Im//VO9Znp+rUCilJYHQ8FvJ7epsOb9/xfr8rCgCERL3ohq+uLFYCRKpfwGIlq+aV
pCmloo7tf0KhCkEQBEE+/64iVIUcLlsgbNIJCUHSA7/+44rO7rau7hGHc8w6ZLW748y5RqiZ19/3
0K0L5SQfD7n6TrWHQGLKzc0oqrwzK5N68vfvNo3SEzoL1aZpd2TOpAg2Fo/xHGtrPN5euXhBhlKh
L6woTrLU2zgAqaFiTrEaAwhZO450WABIY8W6n/7oHi0FTDww3NPqimDGrJzU7OL1piyV8Mn/VDVF
J5yCkupvvPdeiQiPRmMJnhBc5o1isqTsuQsWh88Mu+eYRH/LibHweT2c6uzpd2XPInE2Fo9xHEdM
2CTPX/C1UorkuFgihrEYYETKtJWPPHxXtloEwHvHrPZA3JCSqTGkzl5ze26G/nd/eWk4OHGMv2D2
bffJpIJENJpI0NSV3yEEQRAEQT47VxGqOF//3urGaVkrJDhGSnX5lbr8ygVsIuK2jQ72NL656R1r
kAEAQl+6fvlMOQlM1Hdwy7M7jnRHQFS0+J7vf32RSKxduHpFXd8b1gB7tliKEgaHW19+e7ctmBCQ
1KhtKH5ycF5GOSGWFxYVypptAYZInzXdSALwjLmnY8QRweWmNdet0FIAAC17X35tZ5M7hiWVrP3J
d2/WiyVly9cVnmxvsp2bq4fjAixq3r65qm3ISwhlIdulZyli+oIF9xUsOPszHfa89Ou6C0KVQCAM
WlteeHu3I8QISGLUx4ozz7wjsdg/WLd564GxECMVMPYwseS2dZlqEQCEzEef/Nc2eyiRXrr4rjtv
zlJTmsLFqyvef+HI0MSbIqaix6reOtIySBMSMjB45fcIQRAEQZDPytXM/uPjHfuf/5W9f/XS2XmZ
KRqtWiEWEAKJISPXkJGbppf+7anXzEE+vaQ0XSkCgHjM7Q2L80srAEAYd3hpSKbwlOyC9CSNNXCu
P4vxWjY9/9yBdvvZzBI/tr9nZUmhUlRUMTNpz8lgJHl5ZQ4OwCT8J48c8zGgT8ssyDAAAIB/1MZl
FJRlAAAE3XFGLybl2rTCgowW27mpiDwdPrTlmbcPDFxhnx/H0rF4gj9TISYSodkL96G9A68//+zB
DufZapvOni7S/9I/nz9q9o7/KFaWVpQbCQBgnPu37+ywDAOA+4ODGWXlGYsKcUxYOGeG+oOh0ITC
rSfeeubVvdErqy2CIAiCIJ8HV7dOFc+xgy0HXuisNRiNWq0mNau4csHC8gwlBmDIKi3M1llavDKF
hCAxAJCqc+/8zg8uKAETS5QC4cRXAm77iM05sRUo4LF0dtny56QKU/IrUjU+tsCkUQFA3Nba2BcE
wIRiqVA03uGmvOGBRy88BUXJJfKJb4yOh8w9g1c8iop3dB7ZvLs2NKH7b8R14ezGgNM2anNPOucx
ah0we8Nnf8RFCpkIAADiYVfwTFJiom5vhOMBx4BSKMQ4TAhVtLmtByUqBEEQBLm2XM2SCqRQQnHh
KM0mwmND/WND/W3N9fuq2/78rx+nkzghlqjkChzc8TjNcQAExCPO9qbO0AVtPIx31BeZ+AJNxxLx
89YrYMOu2pMNS6clq0XqeavmRBxFOiUJXLhx/yEHAwDA0DTD8gAYQLjteKOHPj/bcLHeUe/EEnk+
Hol8qK3povioZ6T9VPOks//Oq3Zi8mUWYpE4y547HUdHEwwABUAJJcIzQ6RwSiqhsPH3G4ufXxId
Cl3Ty6giCIIgyJfR1cz+0+beev18b199fVPXaCAKAMBjiiSdFMMAgKfj4ViUB8ZmHYskGBlFsjHf
kR0vHrOcG4uEU5LkZLXH7rncqRhre9tQYLlaJDOUrVgbloowYNzmum4bAADwfo/D7Q2b5DIAaD+4
aVvzhHYkTGBIT0nYLR9xdt8ngInbBscS2RkCoLSVFab3GgdZALEupTArFccAALzmfv8XaZkvBEEQ
BPlSuopQhVOy/PL52SuW3krTPteYJxDERZrk5GQlgQGAe2Swd9DOAQS7j1W3LvnKnCyJOufeH/48
t+ZI31iQkMozswrLSop5y6Gnnnlj5HKRh3G3H2wcKltbLBBpk0QAPNPXWt83dnoprOhY7/4Pmsvv
WCjApRse/n+px2ua+2wcJUlOzy4trdDyw8898Yfm+Ee9JICnVm74dc4y9lzQYS3177/69n7vR2o/
oqOuD/YeLLtnpU4kyFt1/69Uue1j0aIZiwsy1BjwMU/3+wc7aAA0yw9BEARBrmlXEarYRMwXSRCk
lCApY3qOccImOjC8Z8c7fS4aAID17nvzVQV1z8oZWUpj3vrb8s7tx3MWM8NdUasM3Xus1ra8OEUw
fupwe3OTN37mSC7c9P5b24yqdQuLFeqUhevuWDjhSP+ghf54DT8CiTJZMvF5NWzUIiexj1ocR3ce
e2+zVvH16+dJKVHh3NWFZ7aE7b07N73a7EADqBAEQRDkmncVoYpxtf/jDz/LyCkpKDBlpaUq5GIK
5yJBr7mjqa6x1Wr3nV3KPDjW9vpTv/ugePq8GeVpyToxicUiPrt1qK+3s62jf3ysEhN0dHV1AYB3
aCw22Xgn33DDwZrpM9PEABAL9h1rsp03TCpq3/HCX47tz1s8f25mWpJcRDLxkHNkZGCg41Rbn90P
AMBGfea+npCcpCP24OW7A1nXUF8XJp1sEzc86h4PanTAPl5tz5DtgmrHAmM9XV0UQHDYQbPnxTom
5KjZ8u/ek0dmzq4ozkmTUBDzuy09bUeP1o34IuMxk2fitqG+LlwKEHeE0LObEQRBEOQag23cuPGz
rgOCIAiCIMg1D/+sK4AgCIIgCPJFgEIVgiAIgiDIFEChCkEQBEEQZAqgUIUgCIIgCDIFUKhCEARB
EASZAihUIQiCIAiCTAEUqhAEQRAEQaYAuWzZss+6DgiCIAiCINc8zOv1ftZ1QBAEQRAEueah7j8E
QRAEQZApgEIVgiAIgiDIFEChCkEQBEEQZAqgUIUgCIIgCDIFyCvcD8dxhULxiVYFQRAEQRDk2oVa
qhAEQRAEQaYAClUIgiAIgiBTAIUqBEEQBEGQKYBCFYIgCIIgyBRAoQpBEARBEGQKXOnsv0twu1w8
z3/8chAEQRAEQa5dUxCqThw/lp6R/vHLQRAEQRAEuXZNQaiSyqRFJaUEQXz8ohAEQRAEQa5RUxCq
AADDMAxDw7MQBEEQBPny+nSTEM8xowOxrq5Yj5kJx8+9nAjTQ+ZYd098YIjxR+GCAVo8zQybY11d
sZ5eNspd9TmDrnhvV6xrwp+eASYUA/B7fvet9tKSnp++zCY4ruW1rnkVbbPvDI56P/b7vHo9W3sX
zGybdr1/wAEAvt/c1lZS0vuDN6as/Igr1tUV6xm66sv3KeCiif7eWFcPHUxMvgOfCG/928D6xW0l
JW0lCz29sU+2PrGe0bvWtZVUDD134pM9EYIgCPLFMjUtVVeIc7QO3bjKU+/iZYVpW99KXl0OAJxr
wPuf/7U9tyVm9WCqVOnyW5J/8zNFof7cUf1HBm+/x9M4hknVGe8PGxZIruacbGz3070P/ibun/Ca
KDdty1vJ600Q8bNuDxFOAABEPbGuTpoVcTQ7JW/26sR88e7OqD/MxhkA4MN+1u1mA1OWHrgTT3cs
/w0rWlgcPSKdqkKnSrh5cMUG32DMsK0+8+aCD2/nvSeHH3gs4MWly28Sp+pJySf8mwAXo8190Y5B
kSv8yZ4IQRAE+WL5FEMV7fM//Ttvqx9wbMKrbOD5H1l/V8UpspS3r+aaqwNb/s5EiexXnhCrCACA
iN3zjz8GujzYRUq9UpRCVFYiVAgBAIQZIp0SQCa757GsxfdiKUU4iX9o+iLPR4KMP8jTDJBCQqkm
pMJJC+YTUdbr5eI04CQuVVH+2AUAACAASURBVBAqGYZhwDGs285GWFyhxrE4EwxhEgOlPT8O8gzr
crGxBCaUkcx5TUiyr//KtDyAJRUBACRCiTE3YCSh1/ABL5cgSJ0OF2FcOMD6gzzLASUmVWpcTJ0p
luWCfjYQ5lkeBEJCqcK4cMLuAwDg4/TgYAKAMKQRYgJYmg342FAUeMBEUkKtwikCAPiQi3aHgZKS
KiHr8/E8Dzz+/9m76zgryoUP4M+Z053bXWyy7BILSy0dgqSo2IqiiIWIIgpIt4SA0iGKgILSSIpK
bMCysMV2n63TXfP+QSMo933P9b733t/34x+yM/PMM8/U78w8M0M8hKn0udEIHmOzS2MhXDHbV3H3
XV/aaXE1NNMMJlOpIhad2+Jg8MQslfzWOLTHoHUbLbTLQ9gcplzB5HOI0+qsV3tcHkJod3O9o4rH
ECrYKvGdMi06x+UzVq2bkADVtGniADHXn00I7THp3QYT7fQQNufO2rGZnC0amnBYviqKw6KtWmeT
gVA8dogfgxC3utptpxkSHybT5tKbCcVmqVQUl3WzbkatW2eimRwWz/WI2xQAAMA9tI9Gr9fTD3Hm
1AmXy/mwoTd5nNaDS/ODFIV9RuYFCjJFcfXHrtA0TdvyrwexMgkpW3DaTdP23zYXKKgsRVT9viKa
pmnabT0wP08qLXrpqTyKZAnljb+Z/2JG93NZds28IiWZPl1aMivvHdTa9ObALAbJe26Zy+Z2n195
WcbJFHfWVTbTNO0q+a3utRFXgxVZLCrbN+z6i9P1Beo/lu5uKmqZPSE/JiCHReVIlFf7jFb/lO12
0x5dde3oyEwmv3DYi+VDOuXwOEVzTtzbIDbbL1uLUyNzeNwrib3qp7yUK+FmsmJbC+pomm55vUMm
IVef+IKmaVfuujxCsrghFVPeLoj2zYnspclsdGTtq35m4BWlKIvFvBSaWDpxsaXeSNM07bRaT26t
HNE1Vy7KojiXgmIqlh7Qb5pwmSKZ5M5/NUfUNG0xbl9Y2qvdJT4nm83NTUqvXLDDrrPRNG3e8Fwm
ITkhvavfGZ3nJ77SpWtRh9hMprxs2eEbdddM7ZVNSP7IeXbbPcvkuL4vX0SyJary96YVt4/M5nCu
JPRpOVns8dA07XBkH6oc3u2KSpzNZOUERpa8M99Y0uzMP1wcek/dro5dc/fqM+3+5IrgrhEE3cxm
k/PK8eqx/fJ8JdlMZo5fePG4afp8NU3TzlPrr/rzMn27tV6qpmnacfijTEKypP1MNE3TdG0PfiYh
+SPfr3qi5yUhL0cVUTlnl9NG07THVXa+9rmMyyJujm9k+eR3imNDMgmnZMHJf3BjAwCA/2p/U58q
T0tx05I1Dp8+AZNHsAV3XXWqyjI3egjh8Tq2owhh+sZzAgS0QWcrue6habrhXNPiTXTq0/7jH6P+
jw8XGkqbZk6qfOGFyhdeqJq23Fpn+bORLRVNH73XsOUgHdoraP4CRQepfseS6vdXOe+/hOHWr3y/
Zv56m04oGTte0jHQ8cveug/e115ovDXcZj6539wik40cLgyV39MgVZcaZs7UX6lhRHYUJyt0+485
TQ/pUUQIIYR2qLU7jzKTekv7d2aTotrxbzbuOs3u9kzQgtlCX532q89qF+xyuYmz5FjNhEnNB7IY
gcnK18ZJkn0djUZu2wE+ozoTQgjDXzVpkv+kKZIwofO3bVUfzNb+VsbLeEIxdgCpudQ0+53aDb/f
vmLnVl/UHC3jZwyT9hrmO7onw60z7Dzi9BDiaTAey/EweOJRwzkPunjnMWm1u/fQ8iiuH8deeKZx
9Sa71u0uv1A/5Z3mA1l0QCfFK8/w+Abtl3OqPt3g5oQpnh/Lk/AJ4QgHveQ/6QPl4x3uKoxit+np
80Q/ihBCFIrXJ/lPGstoym+Y9k7j7l88ymTFKy/w5VbDtmXVH6+yNz/S3VLLyW+N9SxhQjDRVLSu
X6rPaSTWJt3q6Y3f/ebhh0p6d3Gd+9lUqX6UogAAAO72t9z+c+sMX05vviYK3jZbFHiV3H0nT99K
E0IIlyFgEUIYbA7F5xCXw2000BaNduUCbYU4YPvHgvBLDy/d7sjNtpTWE5oQpoDbvgs/XPmgsVpM
R/aZCCGEMGMbZU+9yA96aImuzKOtv17zUP6inu2ZIjG/a0f2z3m2s5u1edN92/PujGfLbdp40mmj
lbM2R3zYg67NqX5ySPPFy9qDJ6SxPQkhhFDcLs9F7lgk8OffNwtb3nHD+SoqqEPwV7tUPXxt384o
Gr/EZScPxeKoZu0KfjmVwSCOvR9r89Q0J1rcM5EpYAvTU82XDpqObDVOfJ7a9ZX+upYZ2Tf80H5J
mIAQl8dKU3x2wJu5jd9fdHOjfT//XEgIcambVu2xNltZGZOidy9gixm6KQNKl54xbN9sfb3PjRlS
gqDATcdU3X0ZhNDabMnqLfqcndqLc1WCg9prFkbgINWgyAdXlS1WTloT8l6GeeuH5W+vtFdcdzUb
XVn7dL+XUeEZoZu+lXdSOX6anT92vmXv16YZr6s+elu747jNYBOOnxpyf58qBqfdAP8Pihq2nyAk
wGfeUomSshyarT1ZyPBvH/TlTlVGoPPn5YVPf2I9slt3/bUHrfj7cbs9H7lzPrvuTMWwIbrGRmt5
jSvQoT30i5sp9fnoi9BJA0jRvpJRrxmKTY9QGAAAwB1/R6hyXf5ZveN34bD3pe393GWZtIcmtMdj
MXlsTop/o9u0izhoQgjtdnkcDkKxKC7fWXysefNZzqjFsmS5p9VCE0Jo2mM2eOxsisu+q3ijcduy
6k0naEIIN8B32cbA8B4PuP4mjQ+Y94kk1o8QwhAo+ZFiQowPqS/tamxy2x3E2aBZtUBzowcYX0Tx
GB6NgZC7QlVrpVPvIYTDbRvHIIQhlXPD/RjnC50tLR4nIYQQistNac/xvT9REUI8rfUeO2Eqfbkh
AQxC8eIiWFz2n4QqBstX0COZwSCEeJzVdR6aJvaKxs8+uTlYIGIynbTR4KyqpQmhQrvww27032JR
D5g5IVa9U91K0xSnTRuKzSGEcJOjKXLGY6p16smNxqWUycLOvjcCMEOSqByTZlp1TrdzN9v3hNPN
EgwdcrOD2h9QAjGvQweKxWTKFBSHuB0u2un01Fe6HYTpE8j29yGE4sRHsdhMl1Vtb3aSf/DFsZ76
creNMGU+nOBAQih2dARbwLVrm+1NdiK7d1THA170z0vuzpOy6BYxU8glHg/tcnocGnerk8HjcyPa
UBSDhIZxZTJCEKoAAOAf83eEKnddrbO1xbZl6tUtU2/97Xr9yO6mNzdFLekokFGGFrPtaj7dK93d
WupstDDEobyYGNLyo6PZZF/35pV1b96cyKmrGRigm7Ynbt4TdxXP5aZ0k4+W0oQQtowfrnpwl3aO
lJ/WXdIp7BHqy6BkEorNItLY4F3bFe2DCSGEuNxqPTve954RpQEsAUVsTmdFDU18iNnkbNIQBocp
kVKsmyVRQsEDX+DFkCopNnEZdK5mDQmXO2oaXX/+1CGDwxDduANKMX3kDEJoZefoX3YJfG4kG6e7
ycqOUxl8VQxCPI0FjhYHW8UhhKYdHgbn9q1TmngIoQjhCllyKYPhcdXWeVwuJmE4K+s8hLB4Pszb
DwfyhMzb2ZXJE48Zx997yfzTHCflIrJoxbAMBuch944pBuNG6mUwbl2VpChlAMUibn2rS6snIVJX
Tb3b5SZMBVt6u24e8mjve6CUgRSbuE06V7OGRCndDWqX3UmYPmwpm7CZhKKIWe8224jbbM0pelBD
ChmE0BSDwb5ZOQZbzJQwidrhVNfTdARpbnSY70pU+mrDxQKaiEV9uzKZ/9fnJQAA4D/Y3xGqKN9A
YdfubD1NCPGYmmyFJW4Hlxsfz48MZgjaKsYkmb7K1a//tN72mPvsDnOzh53SSdytDbMhTNijB4cQ
QgjtaLVcLPBQLG5SmiDk3mRDxKIXJ4te9GaF2R26icJ8bJdLWlZvZr81hs3UW08fM+Qygg6uuue6
j6idrF+4eU+x/qtPGjxPUmVHtRcbiDxMnN6FYj+s7Ju40V14URJ9WX7D/OmujBDj3h1us/MR3xrG
7TVEIFtras1Vr9ju+1QPlrXefOa4RRsVtHGq4LGRvC/P2spP1k78QD64A6PxulPUN3BiHyKSUoS4
nddbV213hPqJB/WS9O/M3Pm749ftdQvlogBj65YLNIPi9hwqkJEHdU1icJK6SlPbmA7kuQjhpPUX
p0T/A/mCQfFSMgQR3+grstRzZzsHRJm/2+GyuVnt+4pDRIQjZgmYhNjMP25vZXTgJvcWRcv/pDBO
fIYwbp22uKBxwQzX0La2Hzc6dDZmYjdJtIppV7GEfNJQ3rxgoSOeZfjh10epHVMRKuwYo/u+VLt+
Lss0yHP1gLmslZCbaY++frDyuRluZlKbshNCwd/6ChIAAPj38necJNjpT0ceePrG/7tzd5c8+Yqx
IcTn8y033lOl+GSryzW9+aezDVN/YQjk3M6jAlZ8Lg7ikqAXos6+cGMqV8O+4rBRVo7Yf+3xf/A9
Vf8bDFVa0PqVZOoCw/mt5QdXEw6f7RPITR39h8wj9Fm8lebObP75fP27xwhXyA5P9Z0wx3dEHMNU
8+ezYLXtHfjp+85pX1gPbqjNjJF2DaX4le4/6VN1d/WCBoR9/XnDgg2G7+aUbbAz+CKWT6BoWApF
CLvrK+GrNfWrvjEfXG/Y42ZKZKI3OxJCGAnDFf3Wt/xe2jjpxUYSE1WTrxg7PeJ6S8N3J1qXTGlx
M5j+YZKX3w+dPYZ6WFaStvEZN1y9P89NKOGIl/mBnEeq6y3sDsPDljdXTV9pPvJV5Q8OSqIUDH4p
YMYnXAWPMNoonu9rXPaT+Zv55TuIYsUvond7/lnTxfcO+XwJmfG56czW6oN2hkjB6znGf+ZcQYiE
wegT8Opwx+LdluPfOEtTJZ2STJV/nasY0jDV1AXWxmm6Cyca5uYIMjpxlUpXre7mYKfJ1dzqvvGb
AAAA4OEYWu0jvUCcoiiJRPLAQb+cPtm9ZwaT+Uj5jNbVmM5nO218Qdd0np/0xt88+kbr5SuOVjND
IOfGJfPClPfdMqNtdcZD59wUR9BjKFf1Dz0HSLtrCkw5BW5KKerehaO4O5A57JcuWsrUVFg7SccY
oi3V/5rnoWXigd3ZAi6h3W51hbWw1KkxMTh8liqAExXFuVnhe8r36NTWK1cdLQYGR8gKbyOIj6BY
FHFarNlnrHV2TnxHYWLIg4OK22LNvGBT6yifCEGEwJKd73YKRAMyOBK+I+eEqVzLDE6VpkfTunLD
8RwPUyx8bBDndocuj9NdU2IuKncb7Qy+kKUK5MZGs2UCQghx25xlBdaSWrfVTUmknLhUfqic0LSr
Ks98rdxtdREiEg0dyOFTtN3oKLpmq2zwuBlMv1B+20S2hEcIcVdk6rOrKEmYZGDaPetBezo/oI/F
FRFVkKdoI/rjAnlMdabj59yUQNB9IFfJdNcWmrLzPfwAcXoaS8IhxOO8fsVWVuuyOBhiBS+5Pddf
eqNlaEODJeuyQ2umacJJ6SWK8bmnXH2J9udcmkjEwwewOTem8Lgq8q3FVS6znSGScxPa8UKUN4uy
NFnO5ziMTnZ4PE9hNlwsYbD9xCN6sgixnt5rbXFzEjJEib60WWM5f9ZuYPHapwvClYS4nKVXLfmV
NEfGT452FV2zayyctj1Ecb6ktVh7Ko+mZJIR/Vi4/QcAAA/3d4cq+Lfk0mi+XGv65UDjviv8UXMT
d05msBAvAAAA7oEkBH+NdqlbF07XNXEFfcYGTXsaiQoAAOCPEKrgrzF4cVElJkITwuJQnL/qhA8A
APBfCaEKHgVFCf7ffYgZAADg/5W/6TM1AAAAAP/ZEKoAAAAAvAChCgAAAMALEKoAAAAAvAChCgAA
AMALEKoAAAAAvOBfFKo8jpa66sq6Jpv7XzP/f29uc1VpWW2r6dG+Rkebtery0gqD886frIam8pIy
rc3zj8+bdpq1VeWlJSXl/6vJ/1ieS9dUV1FVa3Y9YKDHaawsKa3XWv66GLuxqqKiodXojTrdKvOR
5/5vg3bpGmsrquotD2xtt7W2vKS6yfCopXlsDVUV1Y0a551Gd+vUNeXVDVanF9eDF7maaioq6pqd
7n/2hxzdxub68qpak/3/2A7OxqqyivpWt+ff5suTDquuqqykyeCgbfry8opGnflfVnXarW+qq6is
NbuIsbmmpLLe6njA+cZu1lSVlTSbXHdN52iqr6yqbXb+cWyAv/JPD1Ueu/GXvV8uutuSZccvXlzy
ytC+L3x69ZG+kQP30vwyJD75uRWH7Y8SST32k+ve7dy2x/dVd/526fvp6W06rL9q/odn7Wj8ceU7
XdM69xv87IFSb6QNR/OO6c/36P/8GfUDBlqr9vdrkzx+8+93/7Eu7+iqRauz1Pd8fdp+/afBvbq9
tfKA3gt1uslWe6h/m+RxG856r8h/Nbt680djew4Z92vTAwaatdnPp7UZ9tm+Ry3NcPntgT2HT/mq
7s6G0LL1gyc6jXwzs9JckXVg5aI1edr/V2mgbtYT3bq9Mr9W988+Xep/XDCu08Bnjhc+ckJ9sJoP
B3fo+frnLeaH7upOTem3m7/Y/XOu9f82J28pubDlsZQ2n3xfYrv2TddO3aduO/Uvq5ijeceMF7r3
f+60mhyaNaZNr/GZFX8839D5p9f0b9dm/pG6239yt16fOa53/6fnVfydtYX/FP/0l396HKbzh7et
OVpjMbTqTC6Jj7+Iz3tJGUMIIbTbYtDUO+wckVQpETAIbTPp9EaLi2YKpTKpgMe49TUUj9ve2tjs
4Yo5bouNKQpQCKwmg85g8TBYErlCxGfTLrteq7XYXQwmWyCVywQcj9Om0+qsTjeLK5TJJVwmbWhp
MXnYKqWcOIytGoNAGSihzPXNJr6Q57bZmUKpTMi2GHQGs42m2FKFSsRlOi0Gjd7k8jAEEplUxKdu
1cdh1DQZnXKlUshlmHUag53IlSq2x6bT6WxOmsUTyuUSDuXWNbdYCVelkHnsBo3WJFQFSLg3Uyzt
dhr0WrPV4SEUXyiVSoSUx6FtaXIwhXyGw074PiqRw6TXGSxuwhRLFSIh54H51+2waLU6u4tm80Vy
qYTNZNBuh16nM9ucFJsnlckEd9Yw7TTrG7UWnlQe12f8hh8ei4vmO826Jr2Vz+e5bFY3xVMoZVwW
5XHZtK0aO83m85g2i1Wo8Jfwbn7E2lSRu+/gL4KYQZ/NebtfFM9pNWp1RqeH8IQSmVREeVzalkYb
QyBgOmweno+P9MZktMuiVmtZIhHDZnYwuAq52G7QmJ2UVKEQsuWD35gRNprqoCS026nXtFpcDAGP
a7NZuGIV59ZCtjY22NyUzMdHSFtyfv76s6nH307qHdgpyF8lZVJ3vplDux26lkaLg0gVShGPaTcZ
tEazy02zOHyJTMpnurWtrU5KqFJJiNOmaWkhfKWPjGs16nQGK02xxFK5SMC5/xM8bkdLY73dw5Qp
fYQcinY7TXqd0epgsLgyhYLPpgjtsZr0eqPFzWCJpXKJgOO26hparUIxz2GxuBlcla/qzsqj3UZt
q8lBuDyWw+aSqnzZbrNWq3e4CVckkYuFlNvW3KolLB6LOG0uplwhcRq0RodHrPCR8FjE4zYbdQaT
zUOxRFK5VMDUNzeZCd9XKWXRjtYWjZstUspFToteb7C4aEogkclFPEKI3aLX6kwU0Tv/6poH7XHp
WtQWBy1W+Ih4LLfdrNMZ7C43odhimULMZzNoj9mg1ZsdPJflD4XJhr67MFzHT1A4ju/YNHP2BVfX
ocpYmb+CbzbojBYHoVgCkVQq4d/aDTwWg0ZncvKEPIfFQvHECpmYSTv1Op3Z5qAJJRDJpBIBw2XX
tDa7WCIusdncLJlM4jDpTHZaIleI+WxCe8wGjcFspym2WCYX8+5547/HYdFo9TaXh8MTyuU3Z2rW
tdbbaK5YrpDwiceha9FYnS6aweKJJAqJgOGxqus1lEBIOa12N0Oq9BFxmR6XXa/RWD0sIZdpsdr5
UqVMyHE5LHqd3uakOXyRQi5hMsiNPYJm2xyuP2tn2u0w6HQmm5NicaVyuYBD2Yxajd7GkwidJpNA
FSS+uen7vbXi6ycFkTIew27Wa/UmF81gc3gyhYLLJIQQmva0XP/9i8WzOWkfxCX4RPgEitkunUZj
truYHIFMJuGxiFHbarLTPB7bZnXwJDI+w6bVm1l8qVIuIk5zY6OOJRQSu8VJs2QqlYBN0R63xaDT
m200xZbI5GI+22UzNLcYOWKR22JmipRcj8Fodrg9hMMTyRVSNoPWN9cbab6E4zLZWQGJQ5dtC/Nt
H0Jabi6s3diqMbgUvioBmzJrmnROlo9SzmFRN1aPpqXVSQmUSqnbrGnV2aV+/hyHvklv4/O5TpvV
Q/GUKjmH6TFptUar3U0zOHyRXCaibcZWnUmoCJDwKKuhRWNwKvx93GaD0Wx1ewhXIJJJJWy2bPDr
00NHMjoqyZlbLe+yW/R6vc3hIUyWWCoXC25uLW67pUXd4KQ4Mrns7g2I9rjNBo3B7CBMjlQhF3Lw
umz4K9pHo9fr6Yc4c+qEy+V82FCapmm322Vu3jq5l0zst/qi2eHw0MaCDwe09QlP7pXRSSSQth0x
tcLstNZmfzS2Z1RoSHBwWO/nP8mpN94uQKc+laEgQSn9M+IDokcvbbh2dPLobkGBQQEBkaMmry5U
W6/8tKB7m4iwsPDIyOhnPz9Nu3SHV03uFB0oU8iDk3rP/OZ3O1056/F2AT3GXqixXPzhswgemXqk
0XxuMY8rT+vVPS48+vnF+3JPbnqqZ5xMJvUJiJq5r8zWmL/s7WExocFBQUHpT7x7orjp9vKU7/lQ
JI2d+/1ll6ls7nNpkenPnatv/n7hhNSIAIlcEZbSb/HeHDtdOjkjJmTA+Dy16cy2KaES0ZyTzbeX
yFh+fuLwjnFtIoP8fNv3G78/V91aljMmkauIz+jXMbztkE+vl56d+lyvsMCA4ODQx8YvvtJguNOe
TYcSWYKMT3cZdeq9yyYkhCkUEml02qA1By9ZbKacfcv6p0RIJQpVRMrE5T81Gkw/LXhSxQtae7F4
wzsDVJHd5u3PPbtxvC+RLsw0XNs6WSZTpvXsnxLpJwvqvOp4KU3bLnzzSdsgmW94cp/e6UqJdNah
hlsz9qwfn8hlM1kcoSIwY1/h5S/feyLKTyaVK1P6vrDrYrm2rviFFJ44pvvAtMjoXu+rb01mL/0m
nLDjM/rFBUrFAcmTpn86uG2ARBk9Yc1Rs6nui/G9g2J6Hayhr5/8sleMr9QvdkDPDF+F7JXl53Ql
O6IIJ6Hv0JRQpUASOHnLb8ZL68OUQgahRHJV6KCP1DrbjVlY876OD1Ulde7VOSmYJwl+fuFhJ20+
Mu+lhDaxkaGhQVHt3/j8sK3l2gePJ8b3fSdP76k4v72Tkvfk5782FR1/a1R6WGBAcGjkiLdXXm81
325mS/nOaMJO6PtYx2g/sSLkrRVHWm301UMrRnSOCw4NDo5Ofn/1/lYH3XL99Fsj08MCQ4LCooa+
saBY66z+cRKhFOmD+ySE+0j9E9aeqnPdLtRateS5bgqfsPQ+XWPb9diTU71h+kvxYUEhwcHJfZ7b
nVVtK9jfI943MrFLl6RgiV/Sm9NnPpYUIhAqn523t8lB12TvGTcgVSlTSP3Ch7y1NL+xae1zqZLU
Zy5WGczX9vZpEzhk0rbq2isfPtMrMjg0ODS82+hJuc0O2qle8voAX5koMb1bemJoQOKgo3UP2E0N
zWd7KUlg+yF9EoIEQtXz8/Y02Oi8Y0v7tG0TEx3i4x82esrqEp2rteLXCY8lSxU+3R/r3UYuS3l+
XsWdPVW9/Nk0RfsRJ3bMUQm5DEKJFT5hj8/K/3X7qI5RgSFhEeHhQydsvLMbOLRffzRUwVd1Gzww
yl8c3vWZQwVqXdHJVwa3j20TEejjkzZ00rGC5qYrJ4dEMf2Te3dP9JeFJE/48OOBnaKFkoCnP91p
pOnGyz8+3yc5LCwkOCx29OQv6m13lshpqN/7+cTEMJVEIU/u/cKvNZVvpgXIojsPSmsr5ku6PPVJ
oZHW1/88ql1sXFy4v39w6pDXM9VOunF/LGFHdu7VuW24TOb3+qqjBg+d++PCrhFKRXDy4B7pUmXQ
5I05Nkvjzvkvp0SFBIcEJnQevutijcNl+PrDEWEycVTH3r1So2SxPfZe1j6goV2WS/uXD2ofJZUo
lGHJE5btU+vNh5aMVVDC9KEDI33lC3533Bq17IV4afDQaVWV11e8OSAsMDg8LDqhy5AD1+0328+k
mTEkmMNksHkilX/oinO6q4dX92kbFRwSHBbbdfLan026yiUvdFOogrtldJJKVb2eeXfy2N4+QkFc
xrgLjXZdwZZIwontPrBnahuVX8SktSc1drri/I4X+yTLJQqpf+SoyV8UNdsLD88MItx2AwbGBanG
Lj2y6JWuCbHRIQH+UW0HbDpVYbFbpnQXMILThndvo4x/av/RxQki8uqma5asNX6KwJdW7D/7zbsq
QdjCU2W0q3bOkMSg3m/m1ltuLl/L+Ze6R7QbOq3IQJ9c9ayCBK7Lt+ZtfFskU6Vn9EuO8JUHp395
upJ2lkwfmREfHxkSHBjVaei6X4oLDy5NCpC9vTXf4XZseSOVJ+t5obJg9quPxcW1CQ0IiEkbtuFY
kcPasPr1PoHRGQdq6J0TO5OwIWeK1IVH1g7sGBcTEekfEPb4WyuKG805B2bHCEn7vk+kRfjKwzt+
tP2sqT7vjUHhMd3eLabpit+2P9UjMTQ0JDgi4eXZ2xrtD1ifAHf7W/pUURSTzaYoJiEMis1ms29c
C6D1Fk/npz6c9mR0ycFvfi5vOrFtxdazDU98uGrZjBeaDi9f+u2V+4rRa5wvrfr+289GHV7/2Zcn
dB+t2fLVR31PbVy+QaHfkwAAIABJREFU7fjlnCPfZ7vj5q1et3Hdipd7RBoKjsxZvp1u/8zXO7cP
8ilfO3NOVssfq3WjFuYGd8LnW3d88kTo5s/mHKzym7dl74GdKwclCC7+tHH1rot9Ji7/cvlH7rPr
Zn115vbyhA8e20Nc+8OJC+ry0szL1+N6jgqtP/jZyt38nuO++2Z9d2HhF7MW5Wr+rEk48ojn3p27
bMmShR8/2XTxx68PnrO6CCHEbXYP+WTLltmjLmxduuVow3PzN66aNSZvx5JVB67+sZDK3APzF21W
9P70x/2bk0w5s+evLyjKXbNw7jVmx82Hf5iSzt24YOGRwhpCCO227V/8/uw9tR+sWv/OoGTq7qsx
Dqc4tt/chZ8luXO+/v6CveXy6s+/bg0auGLlwjR/m+2ezjeM4a9O65+kiury/Jb9X0qzts776kjH
N1Yf+vpTdsGhBV/sajK4CCEeg6XPhxu/XTlBfk9lnWpDwIw50+JYJd/8cH7QJ0t7+qi/23nUaL51
I4au2/b5F9nupAVfLBuUInTe6YzibNBIP1sxt3eY++Cu78v8h8+eOEBC5ONXff/TijcVIs5dq9LZ
ShTjpy0cFmU8tG13JeHEDnp12YoVS5Ys6KOo3fT5+kppxOO9OjVWZOZcbSg592MBnfhUf9n+Lxfv
uWgft2jTosn9L25auP5E2b1t7NSYgxdvWv9qmvzbdavOX7u08tP5F6mOK9asfTNDtXPlomO56iNr
Z2694Hpr7vKFr/W/+tOajfvznIQQj8kdOGDN4k9j+TV7dh+9b1uwOTyJ/d/cunlFYOmOpZuPJI2e
unr5rICaA7OW7jYRQmiPle37yvT5nZj5G1buypix6Ll03zP7vs2vM+z5/NOvL5OZ23d+NaFn5s5V
Gw4Udhk5iF94/kxxVW52ZpWB2XNQxvXvFq75ufGJyfOXTX5G9+uG5TsuNmd/t2RHZuLoj5dNflHq
Mf95Nx99q+Xl+UufTpEf/2nX9XprQMLAjxeuWLJo/oR+Yce/23Qypz5334qtxxtf+GzNx0M6OsiD
76MxE56a/XovMVFO2nTox2Xjmq4cOlbMe3/52s2b1r/3VOf7PnjkJp42Pd9YO/c53YVjey6U8VSx
L38w//PFSxZ9PLL05292HMtxeQghhCLSl2dOT3BXbd72c9/XPh6bxj3z3e4CrfqbJQsONag+mL92
2vMdM7fO2Xb6zq3Niux98xZsFHZ9d8/Bw2s+ey5ERAghhlZj13FTP3gytfT0d2cLDFxp/MQ5y5cu
WTLl+V4tv3+95VCxmxBCnHo6Yu6yhcOTeMd37SrQVK1bvPoqp8uKtfO6x/JdTg8hpCV398x5e5VD
Jm1eOyPGdnnx8s3X844uWH2I2/vNLXPH+fFc9EOuVZlby75cOOeSO3nz4R+mZYg2L1pw4Fr1je1C
FDF0w96DzyYx75vE0FR67PCZNiM/3rJ1/fI5E2OVN6+XsPjiF979sG24rMPQd3Yd+mmYLP/zRYvq
5L0Wrdv8UkfzV7MXXGyyEELsLkbykPfe7Rd4dvfmwsBhM957XJt/4PCZGzN12sXtV2766uU06fYv
V2WX1n+z6OOd+ZzFu/esGdfp1NYVW49dchBCiMPBSVr+3f7pT7Qf9NL0JUuXLp75mtKUu3nrXrWV
EELoxrqkCWv3b58RyL6/8pGdR/WK0B764ZymNPN4mbFbj4wwX/7DNr+b7E5xwqD5C6bHubJ2/JDp
YKqGvjl92bLlcz95S1VzdPnGU2Htu3YIVV46eahWX3nwaFHYY0+k+PoNeeX95cuWLFn0tqTs1Jqd
h40P6PRJ+ST0/mju8mXLFn0wNOrwjk1H8ytvtqQiae7X2/pLS1cv3lJlvtW1wFW7ce78U8bIz5at
nTyizc/r5n1/rvUvag7/9f6FFzMZ/nEdho8aRfNPSrfubGrUthaWG1obdn8x/RCbMAIiHYZG1731
C+/93Ev9urod1j0X8iw23lfT36cICQ5R6U2WdoPGdM/ePuX1l8Wq6KfenaUQlNaamUMyHu/XN8Vy
rsP+lVlXKl2EEEITQhOavut4x5APfGZU356dOdrTOcW6iMFvju7f20/IIE7Npg3FzRr9kU2zfucQ
4hvNNTc7CblxZZghTBn3YvpL63bvSkjMrpbPfS5Dn7WowSka1HtI3/4xjSfaHd+ZX1DjIoQQzx/m
SAghpLXmwuqP3zutUcYHuA02Y7W61eEOI4QEdBr18oheYkP9gaLiFn3DrqUf/USILNLfrH9A77OW
qrzKJs8ro5/qkRFY1mXWj/vy8hqu5hdrg54eM6pbr8rGzp9+u/tqhaYnIW5n68/7jsWMnvvm4ATR
fUFa5Nuj78BunUiYLzurqcWq5hS1OJKH9u43uI9/S49vDpffPa5vUIRSxKmTBSSlxOfvu1prCxr2
1OBu8a5uUcu+ulZoMg0ghCjajXhtdO97ExUhhJsybMzI3tIf1ovc/r0eHzPGsnXSsQadzX2rs4i+
puC6NiR1xMD+gzy84g17zt2akNPhiWeGD4zO2bTuql5nYvhGh6pYhB0c1y4lVnbvLPidMoYPe3yA
/ljwz8dbtIaGq7uWT9tyPjQ2zlpvdTbVNzm53Z4YGTZ//JEz+6Q/nQvs81a6kFpcUqZp1Wxf9CGP
EGWkSq+9r505CUOH9+45kHNu16rPC6qKzmeWGI280zOm5lIM4qMKNumL8rMrrQbT+sUzuCxK7OPv
1KmtUkKYAQNH9++RYAxRiWu1rRY3IXeda+RBCaOeHtsl3Hrw1KpmjfbXfWsKf2YRbojC2tJK2hAG
K75j/8ceH1mwdNxpS583xvTbc2bT3rMao7UqO7ue12b8kz17KSMaZn55tLiwXPn2mIHxa3ZuP+Kg
jlj9+4/ozT24pcRqrtvz5fzDHIrhG05aa4pyC/Qcvz5DHus3QJrzw4a8vD9uSneE9Hr6ueH97Ue/
/P6M0WK052euf3f6bmZkvFBfbjHxm7U6Kuea1Sd19Ih+GRxlwood9Q8qhCH0iwpWMAk7LLF9Sgyz
SjtyZGrxirfHsaSBj7/yYXLnJD7vri1D5NdvzIjOLoPKs61JY2ssP7vig48uWgNifW02p6GyQeem
fQghwZ1HPDWmx6/zZlcoe4wZ0u/w1c0Hilqb1bVZhWpLnfmLuR9zmEQaFGRsbXAT3xuNra7Mq2z2
vP7SGwPSVYQQQqoIIYq2vZ8d+ViF5/cNR0t1zcaWvJ+nv/tpgygkmGfSO1yNdQ1OQgjhJA54LKNb
x5zggJPFemNdZWGpKWJwxsA+g1tMF786WEQIaS28ct1sNRxc+/4pHiESJdOkzb9cYlG+MnRI94Hx
JQe2Hz/x4N5EZlPFtUJNwKgnRnXrVadJn7p9x9Xy1kBCGJR02LgJfdrdH0oIIVLf2CGjBq/et+Dp
/Zy4rsNmzU6PVsgYhDAoVkBouIjP5vqEJbdPcZ7fV1aurrOemPfhRYqQCF9Grc5DCJH6RQ958hkp
a/fsA65hz4/oXW7/gnNSb9R7CCGEm9C7X0pqD32XyCUXq6vVV7Oy1fy4F57qmcHzK/1o9anCokp7
GiGEn/Hsq4O6x5mbr8yY98GOAk9SlLhWYxK11OmthBDCiBj47jN9fQjJP33svsrLQxJHDsv45IdN
K5XxdVbxS0MGyO5fRA8hxONx3ek4JvbP6Degazt7qIqd39xiqC/cvGTygWJnZJisxuJx1tY7A156
fmjbkd+cPPON+lRryHtP9bA3l+5cPHlbtjMhVqG221w1zc4/dkt320t+/2byR+usfol+jkq30aPW
m26cYzoOfqZ/t5jGHpG71+WVOB03xzdWZhW1mvXaRTMr2BRR+PsYtU0eosQz8/An/pV3iFksNotJ
uZhMihDCFvj6yPny4Jc+XDE0VWFpLG9Rdr5v1+NKuIQQBkX5RfgxCyVT1m5uJyK6xhoqMDrSL3L5
xn4tNfmbl3z27Vff9Z6bLGS5qsrLGpvCSkvLnBwfX1++hc+yVJoMLVpD4RXtrb2GMFgcHpvBIETg
E6JgF129Vq5uFStdejdHofIRiKUj31ryQnc/u6aumhVzd2Ol9hubuPm9zz8vsCeOHhAuYqpVAmIt
K69sVstLKitpnq9SJRAImOYmg6Glpbq4wHjv81Zl2UeOZzU9+80PE31PDRgx+/ZPKiZHwCWEwWb7
+qokYvLqvA0DQjj6hlprYNIfG1CgCJLxPaWXr+kzrLmlGr5vbJA4xN+HfbXicpVxQH5uhUcgC/Th
kwrCZMv6DU/PO7160Xd9P366wz2lMCg2xWIw3ISiCCFMmVTFY1TXVqobWsqvFxkf9JjYDfLAACl1
Oa9A/bistUTt8I3243I5hBCKK+A9YHQGk0sRikEoimKzWX88LImUAUru2cqaBnWDobxYa7kdQiku
l00oikndmobBYBCXyWS1OURcDuvORTcGg8VlUUwGYVKEEFdD/p5jvwenv7h80csH38641kTchDBD
+o5M463YvJyl4T35aneZUuSvVEhV8rcWrukZyNLUVpOomHur5aq+VKjRJeSV1nMFQoV/VKCM2Rwy
cOWSCUo+pa4p949LMgeLmBWhkxbN7hIiMzVXOhTthHUnCGEymRShHvwoCMVisbgUIRx/HxVfKOv1
4idvD0ukTE1lWkUAUd8YgcFkEYqwuNxbewFNiCwsiG+tKCrRajQFFWYX5eOnkPmGZvRKP7T1qy3c
5qTXZ0WxxaHBUqYo4sVP5g9rG+DUVqpZqVHGApbDVFPbqNfQDRqdhygJITXntq3+qXXM++M6+knv
rhtXwL37n2e/31HATj+5fknzjk9fWX+NeIhvqB+lqy9vNCSzGpvtDvIQDAaDQZxGk8Xm4Pu0SZ++
avNrrRUH1yzeuXX94DFPDA5n3jUmk2ISQjOZhBDaXXj+yC95ujf2/fwS7/uuj82/fWKkmFwWoZiE
weaxqdsbA08eoBQKbHEfL5reLpivryn0xLe53eRiZZCc78n/7UJT1z4cm5YICSGEzWMzqDtr5dqR
PecM/kuXLUvRHp3wwRLivjU3FkUYt7Y6iSpAziooqWhsrr9eVm6y04QQUWCAkuJ0HDt19uj2bqex
ttEd5lugoMyVNc02rU+NWuuheYQQTeXFrzfsUT026dluQTeK5nB9A3zZ2RW5lcYhxbkVHr4s0FdA
1IQQFlfwgERFCGGKfEZMnJs2Wlt94fv3lu7Ze2JkepueNy7SMhlMJqHsDqvJYpPKRHKFKMT38cVz
XglkWStLG5NDefsIYVAsikUIk0koFpd1X6dBR9WlPK0uPKdQLRCJFeKwsCCepTa/RKdjXyu3Erav
n5zFJIQwuQIWIURf8du+E6Udp2/7YqBr4rj3Swmhb203godtChx5n4GDBDumr1tfKIh9tk/KXb+F
WDwBi2MyN2t1+sKcAtOdbeLGQclx46BUn332WF5Dxhurpjwmmjbq8Rw3IYTXYfgIv4XvL11+mRvX
q0dSTE3xxiOn8npOObB4lPvVPs8UEPftqt1G242/H9tXZo3dvHmj6MePfsnPun14qyi61GgSXytq
oFTtfZm31oJAFaDgCWVp85Z8EKnktFZf5ydHGPOPLf02v/fLz/aJ9nvYEsN/s/833e5Yqiden3gi
Z8qGWa/9IBWarPQzS34a0ekBI1JMzoi3ZmVWz5367JO+Cq7V4//+itWGozMmb8rncxktTY70Z7u0
7TnovbGnF3z9YaftFIOtGv7OnCGh/sVD+i4/9uXLYwb48u2uP57qeElT5kysnr5+YKd4IV/4/Irj
M5567emLRT8sev3URqnV4sqYvOmpjDujh3foMbRnm5l7q599d5iKz+H2fOa9J86sWPt2+y8pBsf3
ySmf9g8KlA/ttX7qt8+MLlAwja57D2WB8empsfv2LvmwJtRmsLuU99aFwVcOf+n93wpnrnrr2W/k
PKtVNm7FusEp91c5ttOTb43/fenqJ6NXsljS8Hc/Hp+e0pG8N/HDpVs6RGx0swRDJ3w8OiX6SiZh
MIVjpq19KnTipPde8jjXDXx4J1pGcPd3Xx0yfsHqvt33+EkpN0Uo6v6u2ze0fXzShNMVW8ZnbKY9
/MD27094JkDOeeCYj4QVM27S87+8u/Lxnr9F+HAsNKGoB/8g9E/okhT+3ZLRHU89++kPi15X8B88
GksZmdE+7vOj38+aWqyvcN5cBobwsRfHrHthqSNm4OA+aXwJZ+z4986Vzlky8blNErbF7jN545a+
97aHveTb7qmLq5vdQyYu65E+KHD2+Cnzvxv/aqaI4WAGdVq6YeSYKVPPlM+d+/brCiXH7hC/vXR3
m0ddZnbq8BfGnbqyecPHl/YpXBZr3KiFI2PYDx9f/uLUaTlTVgzv2M5DSEyPp14b00/C5/UbNNhv
x5nrrpQ5Q1OZRDho4pRRFyavm/bWD35Cs87x7PzDwx5/8bXuP22bNb5gb1jL9RYijyKEVGXuX7yq
rN1LT94Xqu7TofeAkMyTMz+cLmy65qQJIaTDU+8OP/LeR6OG7ogW1rbaHnxiYTCC2naODd4/fUDC
gZfnzWqb99ac/R4+V9OqienzRpTqwdGBEEIYVFhSelLkkZ3z3iv2Nzj+8lUCnKiJ0yZeenvR9PfG
KQSUxSP5bPfTt7fXhO7PvPNGzqKvno9bxwuI7bH66yV/LKBNeu/4dUs2L50dw9Y1PywishPf+GDs
pWlbeqWfiJR77ITBYDD8u7768Svn1myd8cxBH2KxJg+b2mnW2Mljty9cNaHXmSRbZRXNiSWEtDRc
2vzFitTwZ2+HKqlPwoRJb3+4+OuOEVtdLP6QNz56sn1M4Z9ePjTWFy575/nzrTynqYWpjE9Njrp9
4Ob6hXaND13+7SfdT+/dfPbAuxPGvz3/64kvnhJRDoeqz76MB/wYuxdlKtzRNWV+TQs9YtKqLklx
MZ98cm3a2v5tE9yEkTToxXHDevLzz98eWxiU0rW97/Fvln50TVaqtpDwvyqeEEIo/67DRiesnPOz
+sW5T4TdfZCQRg55rNt3c/aMHZQlc2sedjbyj0/pECr59bullizfQvPN/V0UPeTJ9CkLT7YOGTk6
NVzociR0TAk/smXWpFyfcuuDVySDI2jbsZvfkR8WTJkSbC28+8Bx/dgXvXe+WW2RPvPh+CTRrXzI
jZs0443Sj758/81XZByPUxA+f8cYXcmRuYsOcHr3RaiCB2Jo77/f8WAURUkkkgcO+uX0ye49M5jM
P81nHmdNYdbVSkN89wERUoq4jPmZ2fW0vFOnFE9jXualmogeA2MVVHP51WsltSYXU6Lwi01M9Jfc
3P+c9paLJ393h7TPaBtCCCFuu7q86EpJtZOw5X6hbWKjWfryvKJqg9nOFioSUzuEKHgOg/rK5atq
g0OkDEtOjlWK2G5ry8VzWToXPyBQ2lxZHdx5UCyr5vDvZWHt2ieF+lCEeBzmyuK869UtHrY4LrVz
pA9PX1ecm19ucBCx3DcyLiFUeefHGE1bTi56+amN1St37Hu2iz+DEJuu7kpufpPRJfYJT2nXRsZn
OU3qzAuXDETk7yNoqlWHpw2I9bm5RB6HqfTa5esN1oAwH2NlPSM0qVOEND/rV6Okba+O4RQhhHY2
VRTmFVXZaLZEGRSXGOMrvnUByN546lgWJya1a1ygXV93+fK1FqNbHhDRtm2cjEd5rLr8q3nVaj1L
6pPULjVQym4szblcpEnsM9DfVnritwJOUHw7H3NObl1UxkB/Q9GvBero5M4RMjov86xWEN8rLcre
WJR9rdzsoPKPrliyNX/WmeIJqbcW3Ka5lJ1tYId1SosVEo++oTw3v8Rgo31C45MTIzguU96F0y38
+L6do+8+bXrMtSdPXBbGp3UJZmVnZ1n5UWmdomrP/1xo8+uX3kZdlFvSQlK6dZPZqrIvFevsnqas
H2Z8sfeF1Rc/e5z3y4nLosQuXSIFRVlZ1Q5px7RUKa0vvJJdrjYJguN7psRwmAxCiMdQc/pCvjg0
KSXGtybv9+Imftf+nSl10YXLZUTkGyi0lNczug7pqWIyTJrqrAuX3eKwtPQUCYsQ2llfcjW/tM5O
OFJVcEJijFJ466FDS93p45cEUTHM5spWOz+pc3qonOO2G8oL8krqtDRbEBASGRsTIWA6G8oLCkrr
rDQlUwYmJCQIjEU/ZzXEdkmLFTuzsnJsgqiOHaIFN071Hmvp5exyAzs1vYsPjxBCzC1Vl68Way0O
vkgZHpMQKbaey8ylVHHt24aW/nawwhP5WK+Y2rycghY6tVNnP56ruuRqYbnazRZFJqXGBckYhHhM
9b+fz9UzfbqmpShEbEJ7mqsLr12vNjmJUKpKapviK2Frqq9dyq9iS30ExKyx8VK7ph1/v+f0so4H
v1mQoLq5cl2O1osnf3MEpvZu5191JfNaC7NTp45id2Pupat6IgmSUVVN5ph2aTG+3Jri3MJKrTzQ
197U5PGJTEtuc+shU3tZzoViIz+tY3sZZcjPzalstohC23YMpgoKSjVGC+FIopJTY/2ljNuHhaKc
/GpL2559fOnasydyhYld0kI4xXmXS5sdweEqbWkdOyq1YzDnStZ5h0+H7u3kV06fbeaH9EiNVF/P
Lq5npGZ092Xba4ouF1U12xk8pU9gYnKi9M5pm3bo6nOu5LcY7FK/iHbtIqsunK1nB/fsGGeuL7hU
1BCZmhEpc1y9eLHeTPz9fLXN1eKwLh0j3KePZvFiO6THyMtzs8uM3PZd0oTGspwrpUYnXXNm28xt
FyatP/PhsFCrpvba1cJGg4MrlEfGJoQHyszqsstXi50CHwXT2mhhpnbs3Hhqxsi3f1t6fO/oeJ87
e4RNV3D1alWDjiVRJaa0D5Kym8ouXSpoSegzKEx093HTfOnkmWZhZI+2IXXXL5c36O1uShXUJrVd
NP/ODuZqLr2WXVDlIMK0Af0CmMZrOTlVzUYmT6QMikqOVtVcyynTMlO6dWXVZ/6Wb07t1VlhqruQ
V+oXlx5i+bFDwsTEhVundRJrnPy2XbqGSNkep6Wq+FpRRaOHK45p2yEmQGxuLPr9Qllg515t/YW0
21lbfPlaRYsswJ9oW8zCwE6p8bWZR0pdoUN7JzMJMbaUZV24pkju01bScvzcdb/YdslR/hTtPjZv
6NAvrXuOfTcyyf/uJXQaan8/f8XKkoX4MKsr9Al9+is0+WcLm+LapYVJ3FcyfzOIE3t2CKrNu1RQ
0yrxDWObKzTsmP7d41ged9W1X69UGEKTe7eLEDPctprrV6+UNkmCQjmtVTphRO8OkfVFl6430+26
dXeXnM1Wc7p1TRV7NFdy8lpcvAh/XkmFPqpTpyBGU3Z2kSQswd1caqSUbdu38+Par1662Ozy79Kj
rcBpqSrMLa5pdTH5vv4h8QmxzNarx7PUcelpsT5/9msE/mv9XaHqP85XEzrP21vV6cUlX85/3u8/
a9EzN7z87PIcEduubnF1fvKjrcvHy/56Ii+oPDrn8Xe+ZYsYjfWGNn3Gbdw0K+qv+rPC/1bz5tmr
JP3fGJke9PCrRnDHlV0fPDfzCIvnbmy0tB/x7prlk8MedJP7j7L3LDzm6vH+k934//8aWl+4tX3C
xLYrD/74Tu9/3lzc+tq1cyYs2nE57fWFX0191pf/4CvfAP8ZEKr+l66c2FOsF6Zk9GmjerSD678P
Q921cznXDTaP2Dc8tX2Sv+RvWkCrpvLcxSutRrtAFpiUmhLuI/rraQD+FqamkvNZ+VqLUygLatcx
NVj+n5D3nYaKY4dzpO179mjj+8+bi8duvHLxTJmBl9q5W6SPAJEK/rMhVAEAAAB4AR4OBQAAAPAC
hCoAAAAAL0CoAgAAAPAChCoAAAAAL0CoAgAAAPACLzyy5/F4jAaD5y/ffQwAAADwn8sLoUqpVDU3
NVoslv97UQAAAAD/przwniqX6+Y3kQEAAAD+a3nhShWLhdd+AgAAwH87XGECAAAA8AKEKgAAAAAv
QKgCAAAA8AKEKgAAAAAv+Af6mNM03kQFAAAA8GCP+koFAAAAAPgTuP0HAAAA4AUIVQAAAABegFAF
AAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABe
gFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAA
AABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUI
VQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA
4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAF
AAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABe
gFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAA
AABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUI
VQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA
4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAF
AAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABe
gFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAA
AABegFAFAAD5O9iVAAAB4klEQVQA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAA
AABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUI
VQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA
4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAF
AAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABe
gFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAAAABegFAFAAAA4AUIVQAA
AABegFAFAAAA4AUIVQAAAABegFAFAADwP+3WsQAAAADAIH/rSewsimAgVQAAA6kCABhIFQDAQKoA
AAZSBQAwkCoAgIFUAQAMpAoAYCBVAAADqQIAGEgVAMBAqgAABlIFADCQKgCAgVQBAAykCgBgIFUA
AAOpAgAYSBUAwECqAAAGUgUAMJAqAICBVAEADKQKAGAgVQAAA6kCABgECIcQpoQvVqYAAAAASUVO
RK5CYII=

--_004_TY2PR04MB30382F0CC7FB86F43221F2BD9DDD0TY2PR04MB3038apcp_--
