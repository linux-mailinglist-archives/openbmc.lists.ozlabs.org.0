Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B17921857D
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 13:05:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1xKv2QnqzDr86
	for <lists+openbmc@lfdr.de>; Wed,  8 Jul 2020 21:05:23 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.132.92; helo=apc01-pu1-obe.outbound.protection.outlook.com;
 envelope-from=velumanit@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=mEE3ddBS; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=mEE3ddBS; 
 dkim-atps=neutral
Received: from APC01-PU1-obe.outbound.protection.outlook.com
 (mail-eopbgr1320092.outbound.protection.outlook.com [40.107.132.92])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1xJ512qRzDr0f
 for <openbmc@lists.ozlabs.org>; Wed,  8 Jul 2020 21:03:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVjBhcOivHJWQh4UKY1ibsmm6tOoV7KCWmsOb1KNl8A=;
 b=mEE3ddBSOIBeaZ9gZwdHAv1qcLpzBeRFQzfYPkzIg33fejLqfpAOkVyGz9rXiYkTvzx12ib5zZMHB9Fkr02IkQukUdc5dzPapYNOnjcru6ppLGihqaYspZ9hSV4B0sLarVGWfUJ8Z2D93B9yTYw+MmLvv4dI0X5eBLDrQ0VirwE=
Received: from HKAPR04CA0001.apcprd04.prod.outlook.com (2603:1096:203:d0::11)
 by TY2PR04MB2639.apcprd04.prod.outlook.com (2603:1096:404:52::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.28; Wed, 8 Jul
 2020 11:03:38 +0000
Received: from HK2APC01FT063.eop-APC01.prod.protection.outlook.com
 (2603:1096:203:d0:cafe::64) by HKAPR04CA0001.outlook.office365.com
 (2603:1096:203:d0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21 via Frontend
 Transport; Wed, 8 Jul 2020 11:03:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.8.245.51)
 smtp.mailfrom=hcl.com; gmail.com; dkim=pass (signature was verified)
 header.d=HCL.COM;gmail.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.51 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.51; helo=APC01-SG2-obe.outbound.protection.outlook.com;
Received: from APC01-SG2-obe.outbound.protection.outlook.com (192.8.245.51) by
 HK2APC01FT063.mail.protection.outlook.com (10.152.249.144) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3174.21 via Frontend Transport; Wed, 8 Jul 2020 11:03:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OYcL/6C/GxfveK+dpDcIdrwe5DH4TG25hQawRDfzacY7O1CRdqXgMfVbVLHVFU+F2gAw3VNgncOxVbWrdHQ5RmBNzQK0wXUleiIuzQ6U9UeOkVRnRvjSkz+x1EFFwU4s+KSG0CbAA5PofDOgrmGr57UZ3iLP9DLJL1bYlCg8G2QxF/eREJUEH0hnxy/WjpOlIuoRphjFOLsUcInCKUTz6C2NUacqbqDXQFsczvFyScnnGgDFoveyv13AkPc+bIDaRt/EVjLz/ojxYBkMgYA3oV+wvt1MxycxGykGZ4QhDfRbO2o2lZfhH/xCTcQzE23ga2SZPeH7ALXSYSCJhcqaeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVjBhcOivHJWQh4UKY1ibsmm6tOoV7KCWmsOb1KNl8A=;
 b=auYQPC8lqvfFqaArW7qMVwGX3z7gz4cmtHUECvetC50M1FiMZV1Th7Aw4/g2Hg1e4lznXA4mf7WgQOZ32SaA1oiVXs2al7kuH9pVKGt5/xeBYjsCIOmIkJeXJ3cLdh/WagIQp1dBNb/BQPe3jeuTWs7HXxJby2Zt7r0vlHr38hXks69cPxSGkAnuFSv5iGqmOcpwLzweDxMvh2cFLx4sUSxuWA1R565nNjzALGpZWPOMb81mgNzaX+0TUQW5PHGphqftwoqoHKgQQBkFf+U4nk7XoumoQz3fTSet15VRJzKBQYJhVbGyLPHfoM+44rALpwrLDxwTRg0ibpGEqgHiTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVjBhcOivHJWQh4UKY1ibsmm6tOoV7KCWmsOb1KNl8A=;
 b=mEE3ddBSOIBeaZ9gZwdHAv1qcLpzBeRFQzfYPkzIg33fejLqfpAOkVyGz9rXiYkTvzx12ib5zZMHB9Fkr02IkQukUdc5dzPapYNOnjcru6ppLGihqaYspZ9hSV4B0sLarVGWfUJ8Z2D93B9yTYw+MmLvv4dI0X5eBLDrQ0VirwE=
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com (2603:1096:203:80::9)
 by HK2PR04MB3619.apcprd04.prod.outlook.com (2603:1096:202:35::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Wed, 8 Jul
 2020 11:03:35 +0000
Received: from HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a]) by HK0PR04MB3153.apcprd04.prod.outlook.com
 ([fe80::41c7:ca16:98b6:9f1a%7]) with mapi id 15.20.3153.029; Wed, 8 Jul 2020
 11:03:35 +0000
From: "Velumani T-ERS,HCLTech" <velumanit@hcl.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: RE: Multi-host support in ipmbbridged and phosphor-host-ipmid
Thread-Topic: Multi-host support in ipmbbridged and phosphor-host-ipmid
Thread-Index: AdZRW6ztFSJjWqCCRaaKJObGR/aPLwCdlhOAAFESgcA=
Date: Wed, 8 Jul 2020 11:03:35 +0000
Message-ID: <HK0PR04MB3153F4836C041355F85AA7C6A7670@HK0PR04MB3153.apcprd04.prod.outlook.com>
References: <SG2PR04MB316063EDE5B383B87F33D96BA76A0@SG2PR04MB3160.apcprd04.prod.outlook.com>
 <A71CDDCD-C7D4-4ACB-80EE-EC03567F6B45@gmail.com>
In-Reply-To: <A71CDDCD-C7D4-4ACB-80EE-EC03567F6B45@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL2hjbCIsImlkIjoiNDk3NjE5NzctYjczZi00MjQ1LWE5NjUtYTViYjM1NmNkZmM3IiwicHJvcHMiOlt7Im4iOiJIQ0xDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoibnVsbCJ9XX1dfSwiU3ViamVjdExhYmVscyI6W10sIlRNQ1ZlcnNpb24iOiIxOC40LjE4NDMuMTIzIiwiVHJ1c3RlZExhYmVsSGFzaCI6IjdOYmw0NlkyV2ljOWJyYmdGaDFLSytqWHlWT3dLRFpncUkxZkVSU1NPQ3ZiQnlRaDl6d0FvOHhxZEpVdEVxTmIifQ==
x-hclclassification: null
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [122.174.180.60]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 739f6ae9-cdb3-41d9-6114-08d8232e90fa
x-ms-traffictypediagnostic: HK2PR04MB3619:|TY2PR04MB2639:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <TY2PR04MB263903FB5FF7C6EAF9074056A7670@TY2PR04MB2639.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:5236;
x-forefront-prvs: 04583CED1A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: KdrK6z/hxhELQraSH3az/FJ1SJHL+S2udyuEQ6SeDrXhzzBYq+o9KsbPWf9O7ppPmEBdrshJtOkPKJ6QOJw1cp2Mmq6SUnoDsnNJj1Wue8BviZlJKXyDdlE/SEylmLeE9QWduOrUJoo+l9O5Erwvg+Idc2oT6ht3UTnVUN/nsc9jE1wmSfs1wuiXR+u2koLmCPZjXAD41GoezFDIzqfp831gk1JKNB1nRE84ehekAOITmBvAnBhps51uD04nImw3cyuYv6ZB0oVE3n1LUUoF+VJE39hFaaMUCnrdK3tCLBtH+5aNSCsM5VRqUQcfxMgIDl/YMLi1PmyGtNbMTLiArBoqlZL/pzR2FL8BW+2upew=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:HK0PR04MB3153.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(366004)(136003)(396003)(39860400002)(346002)(376002)(45080400002)(478600001)(33656002)(966005)(186003)(8676002)(8936002)(9686003)(2906002)(55016002)(26005)(52536014)(83380400001)(66946007)(7696005)(4326008)(54906003)(71200400001)(66556008)(66476007)(5660300002)(86362001)(53546011)(6506007)(6916009)(316002)(76116006)(66446008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: M4oFvVd9CcCyM5ydmAjqF0FIz6wLzq6VZJDI1rUsVtaWGsihkiKClaj1rHxbKwYdXUwMhnaxk6gPpgcUA5Smr8T+tIO2G8HxV57b3Ow+f1cKBIu5k17+9Di3Hf65FGJ9J3xRXljAc6JRdHO/Nc7ckbnsCffhtxC+4uN9KiYXtRONUWys5kFTzD0F2XwAIojK4EBbdW5u9g74i66JP1yp7fMQGq3WmLBZiZ1AXYZYYSnAqWYaDx/npM+/cw/t4vxcjiGv5G+66dh0Ez062IY5UpqppYOkAjr1Rw6NjPbzNPr2IbS7rYiIMRjtaw7e808HlFMNFcDoMyi+LzDv1U/Tg7V76K1BleMMP1WsK3RgO6b4c1GqLhHRGQQ/avAo8ewwTsrhRbZC3DyxqrE1sRUq2+HeYl9gAjq9rpgpMfoy6a8y3URlIi2Il4zJyJxj6PV++hh1LHeGPB6OO20N3UGPNZbV9lE7rvNteKq+I+qUcTKKQIBwwVzDtf0MHLPeyQYH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR04MB3619
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HK2APC01FT063.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.51; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:APC01-SG2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(136003)(39860400002)(346002)(396003)(376002)(46966005)(52536014)(70586007)(966005)(70206006)(8936002)(26005)(478600001)(45080400002)(8676002)(7696005)(6506007)(5660300002)(9686003)(53546011)(6916009)(55016002)(4326008)(36906005)(54906003)(86362001)(2906002)(316002)(336012)(356005)(82740400003)(33656002)(83380400001)(186003)(81166007)(82310400002)(47076004);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7bebc1e7-7545-420a-8323-08d8232e8f5b
X-Forefront-PRVS: 04583CED1A
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z9KjA/XpcsaB8oTVHzx/U4XQ08S+9oW5fZQ9e3ZVdH7g2uDJufR2gI4nJFPuiNsY4zuurIQRMuT7fvfVJOtmRtO2/JJiwRBRaApbl0FstBKnkkKWh/30YpsuAvWgvVPLp/6+XoMOWI5Riumzs+lr3Yb4/SDpVhbYi310b8H9q/f/1dG87Dg11fiHxTyEb6TR1cUakKnJ/GaxXicxb6ujsuYn7TlFnRaAp4otiIiIxjuXAn7zYmG4ZYlCl9kgZYtV6HAqa1VzvlsFy92LpynOyhThWRTUPnlGGWgVLLurja5e/2PkVKVhl3n3gAp1KAnns6COUkRta+ltZmCW/ppBgnwJSVWVp+SeQX+ge4VRuWRKiKcw55j6Xrag93ut95aOZBZn0DXK/hLQFjRsD+P5trCIWEkd7ql2DmuUqgu5pRnCAl8MOrp5+zF5KPm4HO+B
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2020 11:03:37.6013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 739f6ae9-cdb3-41d9-6114-08d8232e90fa
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.51];
 Helo=[APC01-SG2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-AuthSource: HK2APC01FT063.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR04MB2639
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
Cc: Kumar Thangavel <thangavel.k@hcl.com>, Ed Tanous <ed.tanous@intel.com>,
 Vernon Mauery <vernon.mauery@linux.intel.com>,
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Adriana Kobylak <anoo@us.ibm.com>, Vijay Khemka <vijaykhemka@fb.com>,
 Dawid Frycki <dawid.frycki@intel.com>, Patrick Williams <patrickw3@fb.com>,
 Ratan Gupta <ratagupt@linux.vnet.ibm.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4gSSBoYXZlIG1vdmVkIHRoZSBk
ZXNpZ24gZG9jdW1lbnQgdG8gZ2Vycml0LiBQbGVhc2UgZmluZCB0aGUgZ2Vycml0IGxpbmsNCg0K
aHR0cHM6Ly9nZXJyaXQub3BlbmJtYy1wcm9qZWN0Lnh5ei9jL29wZW5ibWMvZG9jcy8rLzM0NDY0
DQoNClJlZ2FyZHMsDQpWZWx1DQoNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206
IEFuZHJldyBHZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPg0KU2VudDogVHVlc2RheSwg
SnVseSA3LCAyMDIwIDE6NDQgQU0NClRvOiBWZWx1bWFuaSBULUVSUyxIQ0xUZWNoIDx2ZWx1bWFu
aXRAaGNsLmNvbT4NCkNjOiBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmc7IERhd2lkIEZyeWNraSA8
ZGF3aWQuZnJ5Y2tpQGludGVsLmNvbT47IEVkIFRhbm91cyA8ZWQudGFub3VzQGludGVsLmNvbT47
IFZlcm5vbiBNYXVlcnkgPHZlcm5vbi5tYXVlcnlAbGludXguaW50ZWwuY29tPjsgQWRyaWFuYSBL
b2J5bGFrIDxhbm9vQHVzLmlibS5jb20+OyBQYXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNrdzNAZmIu
Y29tPjsgS3VtYXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0BoY2wuY29tPjsgVmlqYXkgS2hlbWth
IDx2aWpheWtoZW1rYUBmYi5jb20+OyBSYXRhbiBHdXB0YSA8cmF0YWd1cHRAbGludXgudm5ldC5p
Ym0uY29tPg0KU3ViamVjdDogUmU6IE11bHRpLWhvc3Qgc3VwcG9ydCBpbiBpcG1iYnJpZGdlZCBh
bmQgcGhvc3Bob3ItaG9zdC1pcG1pZA0KDQpbQ0FVVElPTjogVGhpcyBFbWFpbCBpcyBmcm9tIG91
dHNpZGUgdGhlIE9yZ2FuaXphdGlvbi4gVW5sZXNzIHlvdSB0cnVzdCB0aGUgc2VuZGVyLCBEb27i
gJl0IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgYXMgaXQgbWF5IGJlIGEgUGhpc2hp
bmcgZW1haWwsIHdoaWNoIGNhbiBzdGVhbCB5b3VyIEluZm9ybWF0aW9uIGFuZCBjb21wcm9taXNl
IHlvdXIgQ29tcHV0ZXIuXQ0KDQo+IE9uIEp1bCAzLCAyMDIwLCBhdCAxMjoyMiBQTSwgVmVsdW1h
bmkgVC1FUlMsSENMVGVjaCA8dmVsdW1hbml0QGhjbC5jb20+IHdyb3RlOg0KPg0KPiBIaSBBbGws
DQo+DQo+IFdlIGhhdmUgYSBtdWx0aS1ob3N0IHN5c3RlbSBhbmQgd2FudGVkIHRvIGFkZCBzdXBw
b3J0IGluIG9wZW5ibWMgdG8gaGFuZGxlIGFsbCBpcG1pIGNvbW1hbmRzLiBXZSBoYXZlIGNvbWUg
dXAgd2l0aCB0aGUgZGVzaWduIGFwcHJvYWNoIHRoYXQgY291bGQgaGVscCB1cyBpbiBoYW5kbGlu
ZyBpcG1pIGNvbW1hbmQgd2l0aCBtdWx0aWhvc3Qgc3lzdGVtLiBQbGVhc2UgZmluZCB0aGUgYXR0
YWNoZWQgZGVzaWduIHByb3Bvc2FsIGFuZCBwcm92aWRlIGZlZWRiYWNrL3N1Z2dlc3Rpb25zLg0K
DQpIaSBWZWx1LA0KDQpBbnkgcmVhc29uIHdlIGNhbuKAmXQganVzdCB1c2UgdGhlIGRlc2lnbiB0
ZW1wbGF0ZSAoaHR0cHM6Ly9hcGMwMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/
dXJsPWh0dHBzJTNBJTJGJTJGZ2l0aHViLmNvbSUyRm9wZW5ibWMlMkZkb2NzJTJGYmxvYiUyRm1h
c3RlciUyRmRlc2lnbnMlMkZkZXNpZ24tdGVtcGxhdGUubWQmYW1wO2RhdGE9MDIlN0MwMSU3Q3Zl
bHVtYW5pdCU0MGhjbC5jb20lN0M5Y2FmZjU5ZWM1MTU0MzBlZTA5OTA4ZDgyMWU5MmE1YyU3QzE4
OWRlNzM3YzkzYTRmNWE4YjY4NmY0Y2E5OTQxOTEyJTdDMCU3QzAlN0M2MzcyOTY2MzI2Mjc0NzY0
MzEmYW1wO3NkYXRhPTRDRzZwWmwxb3JjT1RrbXdIa3dNaU9qRHlUczNHa0d0ZFoxQk12WEElMkZT
YyUzRCZhbXA7cmVzZXJ2ZWQ9MCkgYW5kIHN1Ym1pdCB0aGlzIHVwIHRvIGdlcnJpdD8gSSB0ZW5k
IHRvIHRyeSBhbmQgYXZvaWQgb3BlbmluZyBhbnkgZW1haWwgYXR0YWNobWVudHMgbm93IGEgZGF5
cy4NCg0KQW5kcmV3DQoNCj4gUmVnYXJkcywNCj4gVmVsdQ0KDQo6OkRJU0NMQUlNRVI6Og0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18NClRoZSBjb250ZW50cyBvZiB0aGlzIGUtbWFp
bCBhbmQgYW55IGF0dGFjaG1lbnQocykgYXJlIGNvbmZpZGVudGlhbCBhbmQgaW50ZW5kZWQgZm9y
IHRoZSBuYW1lZCByZWNpcGllbnQocykgb25seS4gRS1tYWlsIHRyYW5zbWlzc2lvbiBpcyBub3Qg
Z3VhcmFudGVlZCB0byBiZSBzZWN1cmUgb3IgZXJyb3ItZnJlZSBhcyBpbmZvcm1hdGlvbiBjb3Vs
ZCBiZSBpbnRlcmNlcHRlZCwgY29ycnVwdGVkLCBsb3N0LCBkZXN0cm95ZWQsIGFycml2ZSBsYXRl
IG9yIGluY29tcGxldGUsIG9yIG1heSBjb250YWluIHZpcnVzZXMgaW4gdHJhbnNtaXNzaW9uLiBU
aGUgZSBtYWlsIGFuZCBpdHMgY29udGVudHMgKHdpdGggb3Igd2l0aG91dCByZWZlcnJlZCBlcnJv
cnMpIHNoYWxsIHRoZXJlZm9yZSBub3QgYXR0YWNoIGFueSBsaWFiaWxpdHkgb24gdGhlIG9yaWdp
bmF0b3Igb3IgSENMIG9yIGl0cyBhZmZpbGlhdGVzLiBWaWV3cyBvciBvcGluaW9ucywgaWYgYW55
LCBwcmVzZW50ZWQgaW4gdGhpcyBlbWFpbCBhcmUgc29sZWx5IHRob3NlIG9mIHRoZSBhdXRob3Ig
YW5kIG1heSBub3QgbmVjZXNzYXJpbHkgcmVmbGVjdCB0aGUgdmlld3Mgb3Igb3BpbmlvbnMgb2Yg
SENMIG9yIGl0cyBhZmZpbGlhdGVzLiBBbnkgZm9ybSBvZiByZXByb2R1Y3Rpb24sIGRpc3NlbWlu
YXRpb24sIGNvcHlpbmcsIGRpc2Nsb3N1cmUsIG1vZGlmaWNhdGlvbiwgZGlzdHJpYnV0aW9uIGFu
ZCAvIG9yIHB1YmxpY2F0aW9uIG9mIHRoaXMgbWVzc2FnZSB3aXRob3V0IHRoZSBwcmlvciB3cml0
dGVuIGNvbnNlbnQgb2YgYXV0aG9yaXplZCByZXByZXNlbnRhdGl2ZSBvZiBIQ0wgaXMgc3RyaWN0
bHkgcHJvaGliaXRlZC4gSWYgeW91IGhhdmUgcmVjZWl2ZWQgdGhpcyBlbWFpbCBpbiBlcnJvciBw
bGVhc2UgZGVsZXRlIGl0IGFuZCBub3RpZnkgdGhlIHNlbmRlciBpbW1lZGlhdGVseS4gQmVmb3Jl
IG9wZW5pbmcgYW55IGVtYWlsIGFuZC9vciBhdHRhY2htZW50cywgcGxlYXNlIGNoZWNrIHRoZW0g
Zm9yIHZpcnVzZXMgYW5kIG90aGVyIGRlZmVjdHMuDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXw0K
