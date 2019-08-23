Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA5E9AB52
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 11:29:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FGLm14X6zDrdY
	for <lists+openbmc@lfdr.de>; Fri, 23 Aug 2019 19:29:20 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=vertiv.com
 (client-ip=40.107.82.85; helo=nam01-sn1-obe.outbound.protection.outlook.com;
 envelope-from=troy.lee@vertiv.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=vertiv.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=vertivco.onmicrosoft.com
 header.i=@vertivco.onmicrosoft.com header.b="j6kpN+Q2"; 
 dkim-atps=neutral
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820085.outbound.protection.outlook.com [40.107.82.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FGL12lMvzDr2J
 for <openbmc@lists.ozlabs.org>; Fri, 23 Aug 2019 19:28:37 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBLaudxGEmJw6O33iQHTu5tpKE69FaCcvrvk2qBwYz4yn8qYQmEmd0wIG3PSzxIf+VnRqpCMwtLO2C0mHuF+Q1EY3yAs0UakgMArYBWxSgaav0vlOLmH5y4FKjNL3rTdbchzjywAQWNmxFmcfq+hFB8rTLybsvsZRgg5O+1Lg1EWIKrT8k1BLj0FOdcvTIRrclq3+3cmMKGNNtdqF0gcdOgpCFQtYBgydSa3qRThzyAcjmV2ep9XmE/r6LJm8+q5XgPaMY9vO3MQ72wc3XxCx+2CHvS7RSjJ0s/G7Cm5WXKWJsbYonpRMbHrvz7u3ltc56kJHGO6lp3KkwbabtDT9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xLKOPaa1wV8eOyRDO8SDBdsvdxZfOZLMV0if/9Jvus=;
 b=lzIoxkSWiqCEs/XgQyXDxrTmUjBUSMf8kmFrAhT/g+kXEh0BPrK+ne+GfiInP1S4EjU8nJOIM5S1c0Bj0uXWofSIF4RhrUvK4FtZBVM0xgXwPPEsUY+my70Gz/H7Nor+5wzh2p+az+64x+kJYIiIZQnAHG7l1S4bUcZ17lKTlqkK1xHDXHjhwYjOS1NwO8hlaLLGc12KuaQ5Fdv6Av+YqmXGuhRkoM8zO5eJjpG8S96bV9HcfJybKnLtsU8gJ9Ur0LG8LGJSQAVI/udrIbzUuVI1APrvciTUjwxQqsS3Grh/irezjBdnxDqdMoPjIDVO1F624FKKDXY4NWweH2FIGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vertiv.com; dmarc=pass action=none header.from=vertiv.com;
 dkim=pass header.d=vertiv.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vertivco.onmicrosoft.com; s=selector2-vertivco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xLKOPaa1wV8eOyRDO8SDBdsvdxZfOZLMV0if/9Jvus=;
 b=j6kpN+Q2AkW+4gPSAWi68kLXdfNEMcREa2Qk0YxrMlAn4+71zMBxy3lQzk3TI8dVWBtGy0FngJXH26HiXyUW5lvVkZcRA1WCE3mmrLQ5G/T5pNRTWsY7QjuUeAd5xO0Ra1h9LzIbOjfWulTYKLSAC1Ny5TVmqGfk6nyQl5rPJnU=
Received: from MWHPR13MB1360.namprd13.prod.outlook.com (10.173.120.8) by
 MWHPR13MB1328.namprd13.prod.outlook.com (10.173.119.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2199.11; Fri, 23 Aug 2019 09:28:32 +0000
Received: from MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8]) by MWHPR13MB1360.namprd13.prod.outlook.com
 ([fe80::f8a0:214c:cccd:85a8%6]) with mapi id 15.20.2199.011; Fri, 23 Aug 2019
 09:28:32 +0000
From: "Troy.Lee@vertiv.com" <Troy.Lee@vertiv.com>
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Persistent storage of AssetTag
Thread-Topic: Persistent storage of AssetTag
Thread-Index: AdVZkdyqoDYe0P/lQdKzr0V0QHr3Rg==
Date: Fri, 23 Aug 2019 09:28:32 +0000
Message-ID: <MWHPR13MB1360F536BDF71319FE7FA457EDA40@MWHPR13MB1360.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Troy.Lee@vertiv.com; 
x-originating-ip: [103.83.160.36]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: aa07ca06-66cb-4b7e-b7bb-08d727ac43e3
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR13MB1328; 
x-ms-traffictypediagnostic: MWHPR13MB1328:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <MWHPR13MB1328E1397981B6131A96EA60EDA40@MWHPR13MB1328.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0138CD935C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(39860400002)(136003)(366004)(346002)(396003)(189003)(199004)(6306002)(256004)(14444005)(3480700005)(52536014)(5660300002)(99286004)(33656002)(7696005)(7736002)(71190400001)(3846002)(81166006)(81156014)(102836004)(8676002)(186003)(71200400001)(8936002)(316002)(26005)(478600001)(9686003)(6436002)(966005)(486006)(305945005)(6916009)(6116002)(2906002)(86362001)(55016002)(66066001)(25786009)(74316002)(476003)(6506007)(66476007)(53936002)(64756008)(66556008)(66946007)(66446008)(76116006)(14454004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR13MB1328;
 H:MWHPR13MB1360.namprd13.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vertiv.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 79NWsy4aRWuDGZIQBfcGnOGygZRUZ+5jcbf0xVHiXK1UfjHUh3qXnqCQC1v/3hhEt05ch976oEC08XthrEOHgk6zlBUHm7cfN85cAFd5J9FbQein3e7qGUOG+8SdDBtrOgAlc4RWQ9r6p7Ur/OGYOsovTjurhtjsyTGMg1zvb4cKVKkaLnW8Ih3aME07KlfUowoELh7VIRs41fW+ZGuIQ9xG5bF1cGupzbZU5j6mOKVI5z6KQlAaqD0fgyIUJO8QZJ7XlzFRnubEqaS4J96whwz1iERFU/0CbMKMzlKpYqmuoyow9S0GaxQQJDcRk5Okk9eds6RNje0mShaBMMAx9Hyv1gxHUXvvLaiqxR0iuq5m9+KJgrtvrb5B8aKF0BsdxTsTXzgelUg9avHg/2K7MBryf/n3NSjEGUR4Nez6Sk0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: vertiv.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa07ca06-66cb-4b7e-b7bb-08d727ac43e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2019 09:28:32.1900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 74fe92c5-ef57-4d1a-a0e7-9451117d9272
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uh825nNlcbpFb5AH0FWwN/eQP9fg2QLCRWuWfYOBMen0on/HyLTXtnJAWQAIeoEN4PLK6xAxli9CXH+VzAd+kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR13MB1328
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

Hi,

We met an issue about persistent storage of AssetTag.
AssetTag is managed by phosphor-inventor-manager, and it was defined with a=
ssettag.yaml.
Though we could update the AssetTag with DCMI command over IPMI or DBus, bu=
t the value will not retain after BMC reboot.

If we use Notify over DBus, I could see the value is stored in /var/lib/pho=
sphor-inventory-manager/xyz/openbmc_project/inventory/system/xyz.openbmc_pr=
oject.Inventory.Decorator.AssetTag.
After phosphor-inventor-manager started, it first deserialize from AssetTag=
 json file from Manager::restore(), and then it be overwritten with default=
 value in Manager::run().
The issues seems to be related to the startup event with actions name of "c=
reateObjects".

Does this behavior work as expect in OpenBMC? (AssetTag become empty string=
 after reboot)
Does anyone have suggestion how to change the YAML to have persistent stora=
ge for Asset Tag?

Reference:
- assettag.yaml: https://github.com/openbmc/openbmc/blob/master/meta-phosph=
or/recipes-phosphor/inventory/phosphor-inventory-manager-assettag/assettag.=
yaml
- manager::restore(): https://github.com/openbmc/phosphor-inventory-manager=
/blob/ded627c42f5e5319e3704fff742a0227c05f00a9/manager.cpp#L355-L359
- manager::run(): https://github.com/openbmc/phosphor-inventory-manager/blo=
b/master/manager.cpp#L114-L117
- Issue#2867: https://github.com/openbmc/openbmc/issues/2867



Thanks,
Troy Lee
CONFIDENTIALITY NOTICE: This e-mail and any files transmitted with it are i=
ntended solely for the use of the individual or entity to whom they are add=
ressed and may contain confidential and privileged information protected by=
 law. If you received this e-mail in error, any review, use, dissemination,=
 distribution, or copying of the e-mail is strictly prohibited. Please noti=
fy the sender immediately by return e-mail and delete all copies from your =
system.
