Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E35EB06A3
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 03:52:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46TMGl4j4CzF3w6
	for <lists+openbmc@lfdr.de>; Thu, 12 Sep 2019 11:52:47 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (helo)
 smtp.helo=apc01-sg2-obe.outbound.protection.outlook.com
 (client-ip=40.107.131.70; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=chli30@nuvoton.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=nuvoton.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nuvoton.onmicrosoft.com
 header.i=@nuvoton.onmicrosoft.com header.b="NFiQWJ9U"; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310070.outbound.protection.outlook.com [40.107.131.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TMG26MkXzF3w6
 for <openbmc@lists.ozlabs.org>; Thu, 12 Sep 2019 11:52:09 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAVZP1FqwuPpWCw/c4ky8Kl2luVqX+VKSKL9IB+gfpDM8WT0ypAIvOaiFscZ39tZ6Bsc9tNrgmfA+fnowH51fzaQyipwf3Sxaz6I5RdJU5qa9SLQNbe4KQjAiG+5gkYzPPW8zFbqJdN/9N6Up/iBm85WCtmZi04Zk7n0xEcwNQK3B9LhwZd7VelNO9AFwHeozPVuTORWK3t/k0U96cj9THPNeOUpsCag/cjlnmhQ5hRcNsLAi2tUEsEnWTpqu4f7qf9Ooh0rjCZpffkqLNjJSrcwN7tuZ5MWtJ9cDi9XdOh3XqJPp76ZlkAXGLUj51P52gToJKYo7KHz/HtHXpr8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDeA2dYQrLrlvgj+ewlmX4WL3h2X4NaoMJqYACJPMG4=;
 b=UltAx/zaPXIGV73d2wpuTuGq4dkx+dkdQ4bY2funqC6QN4hOF0glw43wL8+mtaMAOozOEOmVhaJ5H/xBZaRx290YYXBcBj0s3Ee9edXFPytjPaouChVYPAaIVOl5FOKwPTYx+XimVlbEpZcPJ7fcvEURgYWZE3frx0PMCJ2O0I8x4vvDueNTqhGeL9PO4PHlQuU9EG4ZJE5WCwgwJiMG2/+/lTUh/3cn2yTztVfvCtJH6nkPaQ1VviusQgHCRDT9HMH51NyWiSf1yq0dn+QZcf4xWWTjm90Vy15v4fYEwL1CNGUsNnohNiMSyJLH91DH2EQZqLqKnmL+2rfhuQEBXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nuvoton.com; dmarc=pass action=none header.from=nuvoton.com;
 dkim=pass header.d=nuvoton.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuvoton.onmicrosoft.com; s=selector2-nuvoton-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDeA2dYQrLrlvgj+ewlmX4WL3h2X4NaoMJqYACJPMG4=;
 b=NFiQWJ9UQhjvFh405ZtO+hJyjOqguzyWeSscHkHQfMisKKwgxmlY3ig7lyc5XJdHZQdH9ig5k2SdrxHJIzKFxS04eF0iAymqIyE1tlWMHgZhxM1veK2uDS97WoepCeGlGzCkWFMHsn02STr+MZ/hxlkdUaovTkeV6+97rGEax8M=
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com (52.132.237.207) by
 HK0PR03MB2849.apcprd03.prod.outlook.com (52.133.157.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2263.10; Thu, 12 Sep 2019 01:52:05 +0000
Received: from HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::50c:3a40:b235:8917]) by HK0PR03MB4660.apcprd03.prod.outlook.com
 ([fe80::50c:3a40:b235:8917%4]) with mapi id 15.20.2263.016; Thu, 12 Sep 2019
 01:52:05 +0000
From: CS20 CHLi30 <CHLI30@nuvoton.com>
To: Wilfred Smith <wilfredsmith@fb.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: Port 80H Snoop
Thread-Topic: Port 80H Snoop
Thread-Index: AQHVaPdArVWxHMOe+UiKld4czdVbSKcnRGpg
Date: Thu, 12 Sep 2019 01:52:04 +0000
Message-ID: <HK0PR03MB466066F3FD37BB68F833E638CFB00@HK0PR03MB4660.apcprd03.prod.outlook.com>
References: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
In-Reply-To: <A9898780-E998-4D00-98D6-70DD8BD4C69E@fb.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=CHLI30@nuvoton.com; 
x-originating-ip: [60.250.194.160]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a233742-a2dc-41aa-d8d8-08d73723d00e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(49563074)(7193020);
 SRVR:HK0PR03MB2849; 
x-ms-traffictypediagnostic: HK0PR03MB2849:|HK0PR03MB2849:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HK0PR03MB2849525E12FE5154C0F02D3FCFB00@HK0PR03MB2849.apcprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1169;
x-forefront-prvs: 01583E185C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(376002)(136003)(366004)(346002)(39840400004)(13464003)(189003)(199004)(71200400001)(8936002)(71190400001)(2501003)(3846002)(99936001)(74316002)(305945005)(66946007)(6116002)(66476007)(66616009)(7736002)(5024004)(14444005)(256004)(2906002)(6436002)(229853002)(8676002)(81156014)(81166006)(66556008)(64756008)(66446008)(76116006)(6246003)(25786009)(478600001)(53936002)(316002)(486006)(33656002)(66066001)(4326008)(107886003)(86362001)(14454004)(476003)(110136005)(5660300002)(26005)(7696005)(186003)(53546011)(102836004)(6506007)(9686003)(52536014)(76176011)(99286004)(11346002)(446003)(55016002)(66574012);
 DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR03MB2849;
 H:HK0PR03MB4660.apcprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nuvoton.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Hy1bkdmb34Q7Mz/HVKCs1tvsnhSEYqjHO9K4fs9IzRLa8JAN2iq8L2KmU5hwSUOiy+y/sSMoYMejonGh/ygyxDo+90mWJJ3yRT9lo0Upi5+xhEFYA3YajFRTC2Y5z5i6c8RO0LeQga67NfTlZZKMvd9hcMlyDV4DPxoEYFZIhXBgLmIilxTcpmZBYDlKS9Go3BaIGyrmdFyAZobLzwUpjOAgVhkxUeeuoCPJC/3maLDDOd/SWt2Pmr3z9HmGvMnSEXoRjpd8Buz3J086kgNB9nDxx4hbPxnbRptJNObFQE6DqvIDLu/zvZdRjuPBLzFw78BOce8IKKmNDXQ5OPa5OGiTADT22As3aHQX3Ls0P6TYScSyLfZ35j/f0eSRLGtpaArdLSbTCyxo3yWzR3AyMWjd0x9l0m9WumkotsjNnHs=
Content-Type: multipart/mixed;
 boundary="_002_HK0PR03MB466066F3FD37BB68F833E638CFB00HK0PR03MB4660apcp_"
MIME-Version: 1.0
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a233742-a2dc-41aa-d8d8-08d73723d00e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2019 01:52:04.9871 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNYVOqBqUfV1gKV7cYgcZW/ORqmfm/SeIcMSaYBZKCv1FKIS6PeMsxU07kIl13+GcfAuXoew5KraDhn6Xcv6Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB2849
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
Cc: CS20 CHLi30 <CHLI30@nuvoton.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_002_HK0PR03MB466066F3FD37BB68F833E638CFB00HK0PR03MB4660apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Wilfred Smith,

You can refer the module phosphor-host-postd and add file recipes-phosphor/=
host/phosphor-host-postd_%.bbappend for changing your snoop device.
(ex: SNOOP_DEVICE =3D "npcm7xx-lpc-bpc0")

Then, you can execute "snooper" program in shell prompt and you will see th=
e POST code be printed on console.
You can refer the attach file about screenshot for the result of snooper. T=
hanks.

Best regards,
Tim

-----Original Message-----
From: openbmc [mailto:openbmc-bounces+chli30=3Dnuvoton.com@lists.ozlabs.org=
] On Behalf Of Wilfred Smith
Sent: Thursday, September 12, 2019 7:19 AM
To: openbmc@lists.ozlabs.org
Subject: Port 80H Snoop

Has anyone done a port 80h snoop history module? If so, pointers appreciate=
d. Also interested in constructive peanut gallery thoughts and consideratio=
ns...
________________________________
________________________________
 The privileged confidential information contained in this email is intende=
d for use only by the addressees as indicated by the original sender of thi=
s email. If you are not the addressee indicated in this email or are not re=
sponsible for delivery of the email to such a person, please kindly reply t=
o the sender indicating this fact and delete all copies of it from your com=
puter and network server immediately. Your cooperation is highly appreciate=
d. It is advised that any unauthorized use of confidential information of N=
uvoton is strictly prohibited; and any information in this email irrelevant=
 to the official business of Nuvoton shall be deemed as neither given nor e=
ndorsed by Nuvoton.

--_002_HK0PR03MB466066F3FD37BB68F833E638CFB00HK0PR03MB4660apcp_
Content-Type: image/jpeg; name="snooper.jpg"
Content-Description: snooper.jpg
Content-Disposition: attachment; filename="snooper.jpg"; size=6717;
	creation-date="Thu, 12 Sep 2019 01:46:39 GMT";
	modification-date="Thu, 12 Sep 2019 01:46:39 GMT"
Content-Transfer-Encoding: base64

/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDAAIBAQIBAQICAgICAgICAwUDAwMDAwYEBAMFBwYHBwcG
BwcICQsJCAgKCAcHCg0KCgsMDAwMBwkODw0MDgsMDAz/2wBDAQICAgMDAwYDAwYMCAcIDAwMDAwM
DAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAz/wAARCABJANsDASIA
AhEBAxEB/8QAHwAAAQUBAQEBAQEAAAAAAAAAAAECAwQFBgcICQoL/8QAtRAAAgEDAwIEAwUFBAQA
AAF9AQIDAAQRBRIhMUEGE1FhByJxFDKBkaEII0KxwRVS0fAkM2JyggkKFhcYGRolJicoKSo0NTY3
ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqDhIWGh4iJipKTlJWWl5iZmqKjpKWm
p6ipqrKztLW2t7i5usLDxMXGx8jJytLT1NXW19jZ2uHi4+Tl5ufo6erx8vP09fb3+Pn6/8QAHwEA
AwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoL/8QAtREAAgECBAQDBAcFBAQAAQJ3AAECAxEEBSEx
BhJBUQdhcRMiMoEIFEKRobHBCSMzUvAVYnLRChYkNOEl8RcYGRomJygpKjU2Nzg5OkNERUZHSElK
U1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6goOEhYaHiImKkpOUlZaXmJmaoqOkpaanqKmqsrO0tba3
uLm6wsPExcbHyMnK0tPU1dbX2Nna4uPk5ebn6Onq8vP09fb3+Pn6/9oADAMBAAIRAxEAPwD+f+iv
sDwl+1V8R/2Yf+CWXwvk+G/jTxB4C1DWfir43W71Tw9dNpuqyRR6R4QItxew7blLdmcNJAsgileK
B5EdoISnr/wZ/wCEp/4SP4V/2J/wkH/DB/8AZXhn/haf2fzv+EN3/YbP/hKf7Xx8v9sfbvt32Xz/
APiY5/sn+zvl/sqgD84K9A8R/Az/AIR/9ljwb8S/7U83/hLfFeveGP7N+zbfsn9mWmjXPn+bvO/z
f7X27Ng2fZ87m34T7f8Agz/wlP8Awkfwr/sT/hIP+GD/AOyvDP8AwtP7P53/AAhu/wCw2f8AwlP9
r4+X+2Pt3277L5//ABMc/wBk/wBnfL/ZVeX+OP2hfjR8Y/8AgjN4S0K28cfE/wAVeDvBPjXW7Dxh
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

--_002_HK0PR03MB466066F3FD37BB68F833E638CFB00HK0PR03MB4660apcp_--
