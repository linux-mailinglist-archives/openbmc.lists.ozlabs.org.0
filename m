Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACF1C5757
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 15:47:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ggyk1m43zDqdl
	for <lists+openbmc@lfdr.de>; Tue,  5 May 2020 23:47:42 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hcl.com
 (client-ip=40.107.131.105; helo=apc01-sg2-obe.outbound.protection.outlook.com;
 envelope-from=thangavel.k@hcl.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=hcl.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=HCL.COM header.i=@HCL.COM header.a=rsa-sha256
 header.s=selector2 header.b=V+0Tm+TR; 
 dkim=pass (1024-bit key) header.d=HCL.COM header.i=@HCL.COM
 header.a=rsa-sha256 header.s=selector2 header.b=V+0Tm+TR; 
 dkim-atps=neutral
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310105.outbound.protection.outlook.com [40.107.131.105])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GbK13yNGzDqcF
 for <openbmc@lists.ozlabs.org>; Tue,  5 May 2020 20:18:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k56PVSuziivFiFUioYv1GgPVZWdTo/zO4GTrm3qt0so=;
 b=V+0Tm+TRRsSuCHByijKb3nIvYOf4RI7h9XjbS0ksym8tUkZ5GEJocvSxiIPKVQalRvDvbX01+dQtN6x1EkJsfZ3StTxO8ai6HDt9CBJuL5AK4irzJZheBlgdJNdn4IxOXi4tX/C0u+bQqxrJePmJ5Lrh6rGnVSmzs6KslGCaR28=
Received: from SG2PR06CA0196.apcprd06.prod.outlook.com (2603:1096:4:1::28) by
 SG2PR04MB3961.apcprd04.prod.outlook.com (2603:1096:0:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.20; Tue, 5 May 2020 10:18:02 +0000
Received: from SG2APC01FT041.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::3d) by SG2PR06CA0196.outlook.office365.com
 (2603:1096:4:1::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Tue, 5 May 2020 10:18:02 +0000
Authentication-Results: spf=pass (sender IP is 192.8.245.52)
 smtp.mailfrom=hcl.com; gmail.com; dkim=pass (signature was verified)
 header.d=HCL.COM;gmail.com; dmarc=pass action=none header.from=hcl.com;
Received-SPF: Pass (protection.outlook.com: domain of hcl.com designates
 192.8.245.52 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.8.245.52; helo=KOR01-PS2-obe.outbound.protection.outlook.com;
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (192.8.245.52) by
 SG2APC01FT041.mail.protection.outlook.com (10.152.251.61) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2958.19 via Frontend Transport; Tue, 5 May 2020 10:18:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHZ618Ak6jNiTgBxiwVEAmDVHahLNoet8whTRk4YLGdkLuY4Z65WgC8PdiUrgn6VVZVzMsqhhBA02ZpwGWj6u74ExEGssNGv39aLLICgUfexA9gEAHmPsVCw2r7u3qeOV6uwGZvPnDVw7iTlEigix77FuTUX+jj8xKIQiYW8rJpT6xxPsnlMKkbnPYpFkf6dhwiZI7wBhAAmKTzZxVfoiZYYjX9IMx2R7Fai43U2qJacWC/tEiAp6bWiP5IKMJxKYrxfAn8qmOY7rK2CJK0Xs/pv/tatsRMw/5Fq4XEnhva+/Us7F3lsUYKg5JSiEzjWOewJYtmEfOJZXruhQtG3eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k56PVSuziivFiFUioYv1GgPVZWdTo/zO4GTrm3qt0so=;
 b=eOZnfeMmAk9RYW9HBhy4UkVCkl3ias4M0eJI+AjLFssfEeYIqP3jE4WMJ7V4lYoTY5MgyuYMpoE1rpYIchxTmp00QcBTcqtM4QDej9nMx2Lydo2SQ8+HpahNvM79zrFCUvCVdElFQwFh7xKaKg7Y/FuBjkeCjKFtwOfixtWCb3ECMcLZN5c39DXVN6IfLuD5HbDJlo1GCrdEA9rl67uNGCPVYOeyRLBkDEFFuHXbO7sJDNN3pB7NSs/j7L+TMou94Aw6nXgW2dRO+qYqmgxQmjNVlaDhu37onYyEesDWTp6ImKCHscka+yGd7mxHRlWXSIWwex+UldOfH6hBYaW5HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hcl.com; dmarc=pass action=none header.from=hcl.com; dkim=pass
 header.d=hcl.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=HCL.COM; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k56PVSuziivFiFUioYv1GgPVZWdTo/zO4GTrm3qt0so=;
 b=V+0Tm+TRRsSuCHByijKb3nIvYOf4RI7h9XjbS0ksym8tUkZ5GEJocvSxiIPKVQalRvDvbX01+dQtN6x1EkJsfZ3StTxO8ai6HDt9CBJuL5AK4irzJZheBlgdJNdn4IxOXi4tX/C0u+bQqxrJePmJ5Lrh6rGnVSmzs6KslGCaR28=
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com (2603:1096:300:68::15)
 by PS2PR04MB3559.apcprd04.prod.outlook.com (2603:1096:300:5e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Tue, 5 May
 2020 10:17:58 +0000
Received: from PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969]) by PS2PR04MB3544.apcprd04.prod.outlook.com
 ([fe80::e993:932c:5643:a969%7]) with mapi id 15.20.2958.030; Tue, 5 May 2020
 10:17:58 +0000
From: Kumar Thangavel <thangavel.k@hcl.com>
To: Andrew Geissler <geissonator@gmail.com>
Subject: RE: openbmc build issue.
Thread-Topic: openbmc build issue.
Thread-Index: AdYet5iAndvlzzdISBKEoFezUYKK/gDdITUAAB1wDjA=
Date: Tue, 5 May 2020 10:17:58 +0000
Message-ID: <PS2PR04MB3544D3F9F9D913A7828B6AB7FDA70@PS2PR04MB3544.apcprd04.prod.outlook.com>
References: <PS2PR04MB354432E1908672CE27203758FDAA0@PS2PR04MB3544.apcprd04.prod.outlook.com>
 <0B252A9A-3E34-4FA5-A872-CDA2C463500B@gmail.com>
In-Reply-To: <0B252A9A-3E34-4FA5-A872-CDA2C463500B@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=hcl.com;
x-originating-ip: [106.198.24.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-Correlation-Id: 7a18c61f-0e02-482a-d804-08d7f0dd9781
x-ms-traffictypediagnostic: PS2PR04MB3559:|PS2PR04MB3559:|SG2PR04MB3961:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS: <SG2PR04MB39618C4DE1A381F0AA9CD0F5FDA70@SG2PR04MB3961.apcprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;OLM:5236;
x-forefront-prvs: 0394259C80
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: LO8TNpbCTUocYTBfBQ1vNGoEQB+eDzfR9fk4+F30LHqXUtFoB3Eec+rCa+7X6Y9ePcgJoEv8rrH/QkjrgOyvGryZI8i+kHVBZnSlX5Pwbt42Rp2DhUydur3p8BboEtL+eR4NmCBNYevhqz3P3RG06FRt07/hYEUzfTLScF2LS8RYTFf6m7bXj6Aymg7FTS9ZR9mDAAyk6ItGdw5jcGWBq9vyeKZkB8rlqQgNmiBv8sxR6ut1vSfgJl7YSRTCUdSS9IKV+ChEfLLzB+n25uxOR77dguAIBZpWFpImK8Ma3uu3Q4ASTutUizSP5R7SYVWDHKGneJiNNCRfaLEivgKjpMI0AyXL3hE3ctYottsgoV4Wy+c9PSWDTUq6qS//PO2IycWGjS7tjVDmqzoD7QAmGN+gc2VhFgxKds/iMkLsBvj3ht1oKUJipMw8J5Xo0zG021PMpMVWCCXTRG0/t19+vVvhaSjCWAj/0u5ymxexwqJelcYmYt6AcD13T3yT9trlNgUjIXdMPxKlyxYjVqWgQg==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:PS2PR04MB3544.apcprd04.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(33430700001)(53546011)(26005)(186003)(6506007)(7696005)(6916009)(54906003)(33440700001)(33656002)(7116003)(5660300002)(8936002)(3480700007)(8676002)(55016002)(2906002)(52536014)(9686003)(86362001)(71200400001)(66476007)(66556008)(478600001)(64756008)(4326008)(316002)(66946007)(76116006)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: CgUgLh/o/KQ26H3rnu2T4ZaG31FqXuc98CBDCYYyhLdK8a9JmxE+2R4exeU2tIDfgZ/5tJIYWGhuUYajiP3iXewl3PGlwcZWBHHPVLQ8MXeYkeqmztxpAEaJN+HSUG3LmCb8rursohBoMo1r5ptoZoFLV/Q+WNAQEIH+YbZuanW9LuGCuGrv3obb661JBBIK+UzHuVWAGCSnZVo8WiXh6M3iDVW+KynMNrHLXt9KO7Hg8ab41xYREp3Yl96tOGHct08TzsVnEHkk8/YsTKOnv4DnSwxmf5fAbitJrtTWrRKwEYNAFP3FuscdMd5ltn7056tizWsGawp5ju1zT0bc1FtYlce50RkH3UFG8f3hvchFA+MS0d/+oVG/nj8IcCPFjtlKGMDPjWGLJtabGWq9JFj35UhxF3NwCuRh0/6hvKkZYtKOUjLYHq4or1q9lp+OiEt8O5P0pP+Jzhe9GO6TZvoiURwtHvmNK/HUkovUeQwMIvLW7nMxqvBCuLnK9m5QhUwhlIc7qbQLozyzMt4KhRkZuvert6exng20fhJ0mDX1uZebNoZsFWIhDMeynrW54uuhLJB8Q04wTS89ncvGQ8vWONhAvusreQNn8qG5OHLcTxIwYwR7sHHM+/+D6492uv3D3uJdmssRNODzZhmplgv2WOmVeFnZ0rl77FyUz22vyn4NrK8h8Csg2b3VohoOBJ57en8v2UFUlBTUY5X5x1HTOQeJ/AdXtJvdM0HLWlkvxhpbp3Zc5Oz6CG6ZkcS6eRWfstseE6oC1zu562z6oRKfhoBiRr40j00u3lAuqeA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR04MB3559
X-DLP: MSGProcess
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: SG2APC01FT041.eop-APC01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:192.8.245.52; CTRY:IN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KOR01-PS2-obe.outbound.protection.outlook.com;
 PTR:InfoDomainNonexistent; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(46966005)(33430700001)(52536014)(81166007)(54906003)(316002)(9686003)(356005)(2906002)(55016002)(33440700001)(82740400003)(47076004)(70206006)(3480700007)(7696005)(82310400002)(478600001)(36906005)(70586007)(6916009)(6506007)(336012)(8676002)(53546011)(186003)(5660300002)(33656002)(8936002)(7116003)(4326008)(86362001)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9c485ad8-e4f3-4cdc-ee4c-08d7f0dd95c2
X-Forefront-PRVS: 0394259C80
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9JZ2Ylya/3R4TTFsMvmdo7R/PjlwCV7EhR4cKvhyz7Vv4LhYCTsGTXXFE4T7pB1FwHAin96f3GKA6dzD9vEAMI1aSopCDd053djtklRM/cedF8n4jVtJUGIMbJdE2BJ8tzTLN+Siv+vskTg3SpH1vMnu+VhXFjRcqUI+ZRptu+Tfd8p0ctOnOxFehlthsKx6vwmB8OCOKmFXNMNIAa+rcUhLiviF00DlwLaq7FZKKYkLMKW3qiioR6EQq5MN1GwzN+3Pv5VmgIrY/gs4CxsUfzEcPfEkg+E4rl8Bc/ZyX4Tny6NeAJSkfQwXsdtT1/+BiOVkNrsZ/4xmr3COZYRQJ3DI6H4AVdbfLc/5H7W0qDWe2IaH23lC4EI+ijNIW0E2FnYnJOFMocciMkolmINHicpcE5KGp1hYj6n/I5qkeSotaxlI95uDyYtBgGuXyH+/7TdwRhNFIreFtevxsiGmIVsJ3cU9bw1NHtGsejN48sIAgGZQFE8cCehgSDFFvC8fj/kX4UosBu7eDj849xWHEdClVok+U4SduYFVNFDdrwgSNO2gqtwiE5qSiFree0XmbuwbIJ8/LgATOacd/+zMxA==
X-OriginatorOrg: HCL.COM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2020 10:18:01.1181 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a18c61f-0e02-482a-d804-08d7f0dd9781
X-MS-Exchange-CrossTenant-Id: 189de737-c93a-4f5a-8b68-6f4ca9941912
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=189de737-c93a-4f5a-8b68-6f4ca9941912; Ip=[192.8.245.52];
 Helo=[KOR01-PS2-obe.outbound.protection.outlook.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR04MB3961
X-Mailman-Approved-At: Tue, 05 May 2020 23:45:57 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, "Velumani
 T-ERS,HCLTech" <velumanit@hcl.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGkgQW5kcmV3LA0KDQogICAgICAgICAgICAgVGhhbmtzIGZvciB5b3VyIHJlc3BvbnNlIGFuZCBp
bmZvcm1hdGlvbi4gV2UgYXJlIGNoZWNraW5nIG9uIHRoZSBweXRob24zIGlzc3VlLg0KDQpUaGFu
a3MsDQpLdW1hci4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJldyBH
ZWlzc2xlciA8Z2Vpc3NvbmF0b3JAZ21haWwuY29tPg0KU2VudDogTW9uZGF5LCBNYXkgNCwgMjAy
MCA5OjIzIFBNDQpUbzogS3VtYXIgVGhhbmdhdmVsIDx0aGFuZ2F2ZWwua0BoY2wuY29tPg0KQ2M6
IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZzsgVmVsdW1hbmkgVC1FUlMsSENMVGVjaCA8dmVsdW1h
bml0QGhjbC5jb20+DQpTdWJqZWN0OiBSZTogb3BlbmJtYyBidWlsZCBpc3N1ZS4NCg0KW0NBVVRJ
T046IFRoaXMgRW1haWwgaXMgZnJvbSBvdXRzaWRlIHRoZSBPcmdhbml6YXRpb24uIFVubGVzcyB5
b3UgdHJ1c3QgdGhlIHNlbmRlciwgRG9u4oCZdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1l
bnRzIGFzIGl0IG1heSBiZSBhIFBoaXNoaW5nIGVtYWlsLCB3aGljaCBjYW4gc3RlYWwgeW91ciBJ
bmZvcm1hdGlvbiBhbmQgY29tcHJvbWlzZSB5b3VyIENvbXB1dGVyLl0NCg0KPiBPbiBBcHIgMzAs
IDIwMjAsIGF0IDE6MjMgQU0sIEt1bWFyIFRoYW5nYXZlbCA8dGhhbmdhdmVsLmtAaGNsLmNvbT4g
d3JvdGU6DQo+DQo+IEhpIEFsbCwNCj4NCj4gWVYyIEJ1aWxkIGZhaWxpbmcgaW4gbGF0ZXN0IExG
IG9wZW5ibWMgbWFzdGVyLiBQRkIgdGhlIHJlYXNvbiBhbmQgdGhlIGRldGFpbGVkIGxvZyBmaWxl
LiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgdGhlcmUgYXJlIHN1Z2dlc3Rpb25zIHRvIHJlc29sdmUu
DQo+IEVSUk9SOiBvYm1jLXBob3NwaG9yLWltYWdlLTEuMC1yMCBkb19nZW5lcmF0ZV9zdGF0aWM6
IEltYWdlICcvaG9tZS92ZWx1L2J1aWxkdGVzdC9vcGVuYm1jL2J1aWxkL3RtcC93b3JrL3lvc2Vt
aXRldjItb3BlbmJtYy1saW51eC1nbnVlYWJpL29ibWMtcGhvc3Bob3ItaW1hZ2UvMS4wLXIwL2Rl
cGxveS1vYm1jLXBob3NwaG9yLWltYWdlLWltYWdlLWNvbXBsZXRlL29ibWMtcGhvc3Bob3ItaW1h
Z2UteW9zZW1pdGV2Mi5zcXVhc2hmcy14eicgaXMgdG9vIGxhcmdlIQ0KDQpIaSBLdW1hciwgeW91
4oCZdmUgZXhjZWVkZWQgdGhlIGFsbG93ZWQgc2l6ZSBmb3IgeW91IHJvb3Rmcy4gWW914oCZbGwg
bmVlZCB0byBwdWxsIHNvbWUgZnVuY3Rpb25zIG91dC4gVGhlIGJpZ2dlc3QgYmFuZyBmb3IgeW91
ciBidWNrIGlmIHBvc3NpYmxlIGlzIHRvIHJlbW92ZSBweXRob24gdXNhZ2UuIE90aGVyd2lzZSwg
eW914oCZbGwgbmVlZCB0byBmaW5kIHNvbWUgZnVuY3Rpb25zIHRvIHB1bGwgb3V0Lg0KDQpXaGF0
IHByb2JhYmx5IGNhdXNlZCB0aGlzIGlzIHVwc3RyZWFtIG1vdmVkIGZyb20gcHl0aG9uMiB0byBw
eXRob24zLiBweXRob24zIHRha2VzIHNpZ25pZmljYW50bHkgbW9yZSBzcGFjZSBpbiB0aGUgaW1h
Z2UuDQoNCg0KPiBQbGVhc2UgZmluZSB0aGUgYXR0YWNobWVudC4NCj4NCj4gVGhhbmtzLA0KPiBL
dW1hci4NCg0KOjpESVNDTEFJTUVSOjoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQpUaGUgY29udGVudHMgb2YgdGhpcyBlLW1haWwgYW5kIGFueSBhdHRhY2htZW50KHMpIGFyZSBj
b25maWRlbnRpYWwgYW5kIGludGVuZGVkIGZvciB0aGUgbmFtZWQgcmVjaXBpZW50KHMpIG9ubHku
IEUtbWFpbCB0cmFuc21pc3Npb24gaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgc2VjdXJlIG9yIGVy
cm9yLWZyZWUgYXMgaW5mb3JtYXRpb24gY291bGQgYmUgaW50ZXJjZXB0ZWQsIGNvcnJ1cHRlZCwg
bG9zdCwgZGVzdHJveWVkLCBhcnJpdmUgbGF0ZSBvciBpbmNvbXBsZXRlLCBvciBtYXkgY29udGFp
biB2aXJ1c2VzIGluIHRyYW5zbWlzc2lvbi4gVGhlIGUgbWFpbCBhbmQgaXRzIGNvbnRlbnRzICh3
aXRoIG9yIHdpdGhvdXQgcmVmZXJyZWQgZXJyb3JzKSBzaGFsbCB0aGVyZWZvcmUgbm90IGF0dGFj
aCBhbnkgbGlhYmlsaXR5IG9uIHRoZSBvcmlnaW5hdG9yIG9yIEhDTCBvciBpdHMgYWZmaWxpYXRl
cy4gVmlld3Mgb3Igb3BpbmlvbnMsIGlmIGFueSwgcHJlc2VudGVkIGluIHRoaXMgZW1haWwgYXJl
IHNvbGVseSB0aG9zZSBvZiB0aGUgYXV0aG9yIGFuZCBtYXkgbm90IG5lY2Vzc2FyaWx5IHJlZmxl
Y3QgdGhlIHZpZXdzIG9yIG9waW5pb25zIG9mIEhDTCBvciBpdHMgYWZmaWxpYXRlcy4gQW55IGZv
cm0gb2YgcmVwcm9kdWN0aW9uLCBkaXNzZW1pbmF0aW9uLCBjb3B5aW5nLCBkaXNjbG9zdXJlLCBt
b2RpZmljYXRpb24sIGRpc3RyaWJ1dGlvbiBhbmQgLyBvciBwdWJsaWNhdGlvbiBvZiB0aGlzIG1l
c3NhZ2Ugd2l0aG91dCB0aGUgcHJpb3Igd3JpdHRlbiBjb25zZW50IG9mIGF1dGhvcml6ZWQgcmVw
cmVzZW50YXRpdmUgb2YgSENMIGlzIHN0cmljdGx5IHByb2hpYml0ZWQuIElmIHlvdSBoYXZlIHJl
Y2VpdmVkIHRoaXMgZW1haWwgaW4gZXJyb3IgcGxlYXNlIGRlbGV0ZSBpdCBhbmQgbm90aWZ5IHRo
ZSBzZW5kZXIgaW1tZWRpYXRlbHkuIEJlZm9yZSBvcGVuaW5nIGFueSBlbWFpbCBhbmQvb3IgYXR0
YWNobWVudHMsIHBsZWFzZSBjaGVjayB0aGVtIGZvciB2aXJ1c2VzIGFuZCBvdGhlciBkZWZlY3Rz
Lg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCg==
