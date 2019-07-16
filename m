Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0211F6AEC2
	for <lists+openbmc@lfdr.de>; Tue, 16 Jul 2019 20:38:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45p8LH20lfzDqNB
	for <lists+openbmc@lfdr.de>; Wed, 17 Jul 2019 04:38:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linkedin.com
 (client-ip=108.174.3.121; helo=mail321.linkedin.com;
 envelope-from=pmao@linkedin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none)
 header.from=linkedin.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linkedin.com header.i=@linkedin.com header.b="rwLYfop0";
 dkim=pass (1024-bit key;
 unprotected) header.d=microsoft.onmicrosoft.com
 header.i=@microsoft.onmicrosoft.com header.b="g+qqMhUy"; 
 dkim-atps=neutral
X-Greylist: delayed 193 seconds by postgrey-1.36 at bilbo;
 Wed, 17 Jul 2019 04:38:10 AEST
Received: from mail321.linkedin.com (mail321.linkedin.com [108.174.3.121])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45p8KZ63y8zDqc6
 for <openbmc@lists.ozlabs.org>; Wed, 17 Jul 2019 04:38:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linkedin.com;
 s=d2048-201806-01; t=1563302093;
 bh=F8xRvbJs9qIGXhL3pc0Rtg7d+BzZARQqo3Yc77fPTMM=;
 h=From:To:Subject:Date:Content-Type:MIME-Version;
 b=rwLYfop0s73s8HYCkZ2jmTm25glRH6IXChnIEBuW0yI3El3riLaknPoBvo70nShtn
 vpFq3Ajh6P8n5OENyeqXxEAV6J3HPltr1fc7HStiJpdbKDG++XxeUjPkKCWFkGJZGW
 nvwcMPgSgfM1/qbospwReebwq+oMJUxLbZa0XmTZGPEkt5KoET9S8LgTnul3vc3EO7
 eEjuKvx/FGCd520p4mkMbyfHKOBQQxSMS1JUszD9RY/bD35f+BWY+SHxcpj3Igu5Hs
 uTagFheAsNm+yqsjQnpltgMIWgFAqqxuTNYqRZeHCueAIyQgFLikDqOwoTTkGw9gPn
 j+iATkO9r64Dw==
Authentication-Results: mail321.prod.linkedin.com
 x-tls.subject="/C=US/ST=Washington/L=Redmond/O=Microsoft
 Corporation/CN=mail.protection.outlook.com";
 auth=pass (cipher=AES256-GCM-SHA384)
Authentication-Results: mail321.prod.linkedin.com;
 iprev=pass policy.iprev="104.47.40.59";
 spf=softfail smtp.mailfrom="pmao@linkedin.com"
 smtp.helo="nam03-co1-obe.outbound.protection.outlook.com";
 dkim=pass header.d=microsoft.onmicrosoft.com;
 tls=pass (verified) key.ciphersuite="TLS_RSA_WITH_AES_256_GCM_SHA384"
 key.length="256" tls.v="tlsv1.2"
 cert.client="C=US,ST=Washington,L=Redmond,O=Microsoft
 Corporation,CN=mail.protection.outlook.com"
 cert.clientissuer="C=BE,O=GlobalSign nv-sa,CN=GlobalSign Organization
 Validation CA - SHA256 - G3"
Received: from [104.47.40.59] ([104.47.40.59:23411]
 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by mail321.prod.linkedin.com (envelope-from <pmao@linkedin.com>)
 (ecelerity 3.6.21.53563 r(Core:3.6.21.0)) with ESMTPS
 (cipher=AES256-GCM-SHA384
 subject="/C=US/ST=Washington/L=Redmond/O=Microsoft
 Corporation/CN=mail.protection.outlook.com") 
 id F8/4C-32691-DC81E2D5; Tue, 16 Jul 2019 18:34:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dJ4VEqQV2P2hEDmvIDb5f8K/3sxElKUnL018Id0jyxOqGSll2m3UjUWwLkwjbhOQpojPeHLQoApKp0IaSZgRBaKHrZLNqW8WHzJpGsC5DCOk9oFtNpOi2l8PS+atR99mBovBQHMdBXTrI312z4z7BS1mGY/5YP/zgYs4SrfisgCgJHHYpb59cUAWxpY7z7YlSJ6HBN24dXc2zUX+m2SVsua+ENHC3El+mcLoapOjO2+zokdvoqHHcTQgkVBKYmKElzRvKblDp13AhX3g87WkTk14CNL5AOYrZZds1Gjx68MEXL3aY9G2W9FXaiB0WePEhbJ/OVAShPUbWy+k4Tp1cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8xRvbJs9qIGXhL3pc0Rtg7d+BzZARQqo3Yc77fPTMM=;
 b=n+hBLgQsfCXA1R/Ne6/qNZ7zSTGFsdo+QfN+8k/nkkKLq0QQngU/RQBsgivdbdFKdH53NBlnEl9yI8Ooibng0rum++m0l1KsJZ9IROx004TA41a0gYDLACQIK+t9H2Auy1EDccvhbGZtBG9dPCL5hbrkksIQf17WAVzAmS3IcXncZG2hzP61ACWiK2Hu7mVkKZ3WMo6iFVtDd3T6u+q/PEqnc9w0Y93SKmN79j/6w/xryPqC7j4E0IoZwWyKAxLu8vv8bsFuuNd7eB4dS4wiSbDsMUxu7rU3ZNM6nj616UG4Tip7sEN2tgr9NcNLbLYMaOPpqHSrvWF4oA4FkhZiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=linkedin.com;dmarc=pass action=none
 header.from=linkedin.com;dkim=pass header.d=linkedin.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.onmicrosoft.com; s=selector1-microsoft-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8xRvbJs9qIGXhL3pc0Rtg7d+BzZARQqo3Yc77fPTMM=;
 b=g+qqMhUy7LZpqG18S0tmw5yTVYo5e+cl76LxXClqKnQ2CYpR0W3c2RJGLAAq3jBlt35dwJJIXusdLwmOSM2FZUzyO1Nn6pfyGXW7mFrA9/yOnCFrE108s8ooQpXaGOgpNHHRZLr5Z5LX35LE7qdUfk/ISSBXuE5IFYtGdkkILzY=
Received: from MWHPR21MB0831.namprd21.prod.outlook.com (10.173.51.9) by
 MWHPR21MB0797.namprd21.prod.outlook.com (10.175.135.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.2; Tue, 16 Jul 2019 18:34:51 +0000
Received: from MWHPR21MB0831.namprd21.prod.outlook.com
 ([fe80::b172:85df:32d0:8364]) by MWHPR21MB0831.namprd21.prod.outlook.com
 ([fe80::b172:85df:32d0:8364%4]) with mapi id 15.20.2115.002; Tue, 16 Jul 2019
 18:34:51 +0000
From: Ping Mao <pmao@linkedin.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: BMC websocket
Thread-Topic: BMC websocket
Thread-Index: AQHVPAUn+oldHT3Sf0ySH/PjRZ5vYA==
Date: Tue, 16 Jul 2019 18:34:51 +0000
Message-ID: <82B71204-7C02-4A78-93A7-6AF55AF6C5A9@linkedin.biz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=acaae2cb-7ef6-4bf1-bc52-000059c7c4f6;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=General;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2019-07-16T18:26:42-0800;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pmao@linkedin.com; 
x-originating-ip: [2620:119:5003:20c:591b:366c:86d1:6d7d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b8144d26-d7fa-4026-6004-08d70a1c4a0b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR21MB0797; 
x-ms-traffictypediagnostic: MWHPR21MB0797:
x-microsoft-antispam-prvs: <MWHPR21MB07970FEBF442195A0589C689A0CE0@MWHPR21MB0797.namprd21.prod.outlook.com>
x-o365ent-eop-header: Message Processed By - CBR_LInkedIn_Mail_To_External
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(376002)(39860400002)(136003)(346002)(396003)(47662002)(189003)(199004)(36756003)(81156014)(486006)(4270600006)(558084003)(6916009)(221733001)(186003)(10090500001)(7116003)(102836004)(478600001)(25786009)(6506007)(256004)(305945005)(14454004)(46003)(99286004)(476003)(33656002)(71200400001)(316002)(71190400001)(91956017)(76116006)(8676002)(66446008)(64756008)(66476007)(66556008)(6436002)(66946007)(68736007)(8936002)(5660300002)(3480700005)(6116002)(9686003)(86362001)(81166006)(6512007)(2906002)(6486002)(7736002)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR21MB0797;
 H:MWHPR21MB0831.namprd21.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: linkedin.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Q+E/U/UCQ7r4ZM4AXRxKXN9TIYBiCa6ZOZWmW/9KO3vwjM6W9GNXP7XiJBh9FVCZ709/7UfCs3/B5BLkFQupNq9GEe7ZVFXsI2ptmwdCb4rAJHNYbtSrxnl3dMIVjW7JiDGtKh+i+XY8mE+L61h3teNKDuk4ZuIOumREymWd9sefWuoi8rzanFsnsgOBa6uuflmGU998nMJOKmoptf1Tx36CHsmn6p1SnvgVocHuoNRSJMEz7lBpRKJLrSZeTb2JUfyOdgd476vO3ghKt83x5QorSpsuf5owKmqG7X39g0uk9sFQPtBOgJa27ZEluXVggxKg0l1pfwUlkg39bE030Y+jJRJWIn4mI5Ss9G7NckKQbQ86Zy6FWO1NYcA6TcVaas8I7gnUMJGhsTpDANV56E4rA7E20LRCVULP/1ClBKY=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <D49F4E6941240846AE818EE4D2862E64@namprd21.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: linkedin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8144d26-d7fa-4026-6004-08d70a1c4a0b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 18:34:51.2496 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pmao@linkedin.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR21MB0797
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

SGksICANCg0KQ291bGQgc29tZW9uZSBzaGFyZSBob3cgdG8gc3Vic2NyaWJlIHRvIEJNQyB3ZWJz
b2NrZXQgZm9yIGV2ZW50cz8gICAgVGhhbmtzLg0KDQpUaGFua3MsDQpQaW5nDQoNCg==
