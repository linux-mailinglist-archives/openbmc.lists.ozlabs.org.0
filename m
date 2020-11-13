Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8412B13C7
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 02:19:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CXLH61HCvzDr4g
	for <lists+openbmc@lfdr.de>; Fri, 13 Nov 2020 12:19:46 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=fii-usa.com (client-ip=40.107.93.50;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=lancelot.kao@fii-usa.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fii-usa.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=FIIcorp.onmicrosoft.com
 header.i=@FIIcorp.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-FIIcorp-onmicrosoft-com header.b=cUfvJIPj; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2050.outbound.protection.outlook.com [40.107.93.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CXLGK19btzDr3h
 for <openbmc@lists.ozlabs.org>; Fri, 13 Nov 2020 12:19:02 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkNv7ZFE3adMhfZxj6DAj+849eNPc3tU9Ko3YbmuYZf/FoIcexsM5iQdOcxqxFcp0LfzTsNkdIfzbwNpy3cep3tBGNv5JbtJ6anCTx3Wrpz4i/GV+U8ZJPhlUpsdVsOy4egx5q3hUIYhC4OrziheZfU1JnWNDBEzTM1GuTPB1UZN85jjI5z1ESQGNfOhSxCRdANnHlO1Gl3bt90wbQeQTbVLAzDfQgWSrlcvEWQdy3wbIz2lUuCPIDZ70qrcQhVNgXnCWvi+ASkhXP/1KWRFbTYVkP7LQUOyEX77Ig1VCId+jHBbdlWZ2PnFlvh6t+oQmVSrlVp7THSz6lRZZrVmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB9l+GqIkUj6gT6TFZC/c8d2ITpaqwzAvmRyypXMz+U=;
 b=CM3unpjoF0UoHYxXJykF/yc9ODuFoKd3/znyMYqQpMERFt/gRKtaHx3+1agflEIkvKMrlob/cx/3On2s+5J4kYXO3dsKLkLMpcRHPIcqFSzURAcfF9oohuHxnKg2oJ3Kv8ME8DdAV8VWhwVFIKwKBIE+YJE5YkbogYJ+oTlvKl3jJhEn29Z2gqcOV45xrztHDrZpi2S5Lx0OvSdWNeWXa6MHlexsPuYwZO9LtcG555SaBCo+L8WB5auFMo3PgYzpnIh+1vd8HvDY1hmshZziCqID+2/bO9BIFsQWmUjm18SlvoIhM//qeO3mLoUEV0P329/C8Wz1VCeQqCPPZ3BjTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-usa.com; dmarc=pass action=none header.from=fii-usa.com;
 dkim=pass header.d=fii-usa.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=FIIcorp.onmicrosoft.com; s=selector1-FIIcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DB9l+GqIkUj6gT6TFZC/c8d2ITpaqwzAvmRyypXMz+U=;
 b=cUfvJIPjrEppIsNfRUFkxTVybSFSiVfRF6RHTmsnKbElMDf8GwJDY8SQ9DaRfo1Q+zSX/Y+NGIDRqUcDCopM2XsSnsqXzX/XqWbnQ+84WitO53PP27vnWR0p0kd8KYbbaTtjCFpA6FcLVocZRp2J4OGo6XiS0sLwv8KvYKLJ6aVkJOs4RZZUYNlGZQWRI8R6ee0xfev4454F1tkkbX4gPzHdFWQw5k0ybj2DyowWQ3IBJivfkwyjx7BVPWwrhzoDmZ9g6C3cpbch+JS4QHdBobzf5vSq/odeT5UP2xxEQagu4FzUmqn7hckFPoK17HajZZ3UYFOf3BymZyRFSfcEGQ==
Received: from DM6PR08MB4890.namprd08.prod.outlook.com (20.176.117.210) by
 DM6PR08MB4073.namprd08.prod.outlook.com (20.176.64.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.25; Fri, 13 Nov 2020 01:18:55 +0000
Received: from DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e]) by DM6PR08MB4890.namprd08.prod.outlook.com
 ([fe80::40be:143a:73a2:b33e%7]) with mapi id 15.20.3541.025; Fri, 13 Nov 2020
 01:18:55 +0000
From: Lancelot Kao <Lancelot.Kao@fii-usa.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Please add meta-fii as a subtree
Thread-Topic: Please add meta-fii as a subtree
Thread-Index: AQHWuVr0Lfdt4OXU2Eq6f0o3g+w+EQ==
Date: Fri, 13 Nov 2020 01:18:55 +0000
Message-ID: <101AF305-0894-4AE9-8FD9-2FF0B4F09A81@fii-usa.com>
Accept-Language: zh-TW, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.ozlabs.org; dkim=none (message not signed)
 header.d=none;lists.ozlabs.org; dmarc=none action=none
 header.from=fii-usa.com;
x-originating-ip: [73.232.2.233]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4c0b6c9-1bf9-48a7-3bb6-08d887721703
x-ms-traffictypediagnostic: DM6PR08MB4073:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR08MB40736945898FB9CE51ABEA31C0E60@DM6PR08MB4073.namprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S2ra37TyThK3K9i5Lk9iNdltzXF3iubBuXCngqVHEDjdczQpM1MEQiqvHAJBlo6e9ZL6qRgJtFnV/QK67D1L1J8xGSkJxLh0ZtjET8Evxa/d1XhXRqydaMa/0z0VXoar+rOEf1T2hOgGNjiNBFwZyTn/DD4UjTrSaQVAq3AGbCYOsL7Mr4lnIhvAGTMJOVEXwtkacuF3h5qSLXfY1khvn66xcp9Wq2flcN6D+imUc8YoC7JLmGzZc3L7eCq5ljS2ZvAGq/+MqUSvCcI+63Hly3/vwwO0InuITQIYaBia+GqHTxN3kxUji0NtMpEDxioDHH8/E0k7Y4HVNVXxw5bc7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR08MB4890.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(396003)(39860400002)(346002)(376002)(26005)(6486002)(2906002)(33656002)(316002)(6916009)(186003)(107886003)(558084003)(86362001)(478600001)(2616005)(6506007)(54906003)(8676002)(66556008)(66446008)(64756008)(66476007)(91956017)(76116006)(5660300002)(8936002)(6512007)(9326002)(36756003)(71200400001)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 2aA7OjywpsuHC/JvR9aQiN4ibneCpk9iMM9NOyM3M0/MVC97922PGCqRxmC3ArDgHxQWtFkmvV3A/rhUYw7OLkplGYc5EccFQ8lt41X7QfxqmFAHYDlVaO4wGA7ndcbIA9nukq+Soa7bQKbY20mRrsLEWJ3c4DX4MGQw4CFvPcOJrBqJ2ettGAtGvFT8HlWEiyVcaPX2ahkmTiw63f+AswFVACbz0o5n1YUYKO6sbqBa5x+4aW7ewl3mQRertREWBJ1QMTaQ8qR3cpiD+ERqVc8i60X3JLeNWUSPl4eStj91bmO4hXJIJS9WtHPU4B+rggfmCm+GewetuimIl0GYHJdZk+PEvPfU4pInXN0mPReKyTh4VGd79dNOgA8vNlLZ1QCrj85zRhLjHPEqPpSHyFUwS5SuAovqcj36E4AZA7e67JnVIBZ5mwn88PyIt/panaZIBY2EeHx5VC7doT8vpA7iCUnlrlr/L4yt5ud0Tb1+oLlJCdYxzUK00lqF/O8kXgKy++PL7UOCNYUTFonhJtf1k6Jj/ZLbmF3u9UV392b57BQZYj+ZJEUNMK4UD+dA0lzCsB45cyMAGGriTWxLCuHpAw/j/KLpfRxkmQ3OEhWDwCp0wXmMyTkEvNRuNphYIS72BNoOoV6TgK6Hm1+/yg==
Content-Type: multipart/alternative;
 boundary="_000_101AF30508944AE98FD92FF0B4F09A81fiiusacom_"
MIME-Version: 1.0
X-OriginatorOrg: fii-usa.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB4890.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4c0b6c9-1bf9-48a7-3bb6-08d887721703
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Nov 2020 01:18:55.3815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MqzW9f6ZzaK9VN7u7RMTMRTARSt9bzuRUQ3MDtyrC5S4LOTkoqFTJxYyc0PRlytKKFY5CVF/vD3jWjTwRXKBq50ZQgwW9mgrWbCTL2P2OGE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR08MB4073
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
Cc: Mustatfa Shehabi <Mustafa.Shehabi@fii-na.com>,
 Vivekanand Veeracholan <vveerach@google.com>,
 Mohaimen Alsamarai <Mohaimen.Alsamarai@fii-na.com>,
 Benjamin Fair <benjaminfair@google.com>, XP Chen <Xiao-Peng.Chen@fii-na.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

--_000_101AF30508944AE98FD92FF0B4F09A81fiiusacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQogICAgICAgICAgICAgICAgTXkgbWV0YS1maWkgYXBwcm92ZWQgYW5kIG1lcmdlZC4gQ2Fu
IGFueW9uZSBoZWxwIHRvIG1ha2UgdGhlIG1ldGEtZmlpIGFzIGEgc3VidHJlZSBvZiB0aGUgb3Bl
bkJNQyBtYXN0ZXI/DQoNCg0KLS0NCkJlc3QgUmVnYXJkcy4NCg0KTGFuY2Vsb3QgS2FvDQoNCkNB
QkcvRmlpDQpVUyA6ICsxLTI4MS02NTUtMjY2OA0KZS1tYWlsIDogbGFuY2Vsb3Qua2FvQGZpaS11
c2EuY29tDQo=

--_000_101AF30508944AE98FD92FF0B4F09A81fiiusacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <3AFE144977B16B4D88BE9C4E46B1EC5C@namprd08.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWwgeG1sbnM6bz0idXJuOnNjaGVtYXMtbWljcm9zb2Z0LWNvbTpvZmZpY2U6b2ZmaWNlIiB4
bWxuczp3PSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTp3b3JkIiB4bWxuczptPSJo
dHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL29mZmljZS8yMDA0LzEyL29tbWwiIHhtbG5zPSJo
dHRwOi8vd3d3LnczLm9yZy9UUi9SRUMtaHRtbDQwIj4NCjxoZWFkPg0KPG1ldGEgaHR0cC1lcXVp
dj0iQ29udGVudC1UeXBlIiBjb250ZW50PSJ0ZXh0L2h0bWw7IGNoYXJzZXQ9dXRmLTgiPg0KPG1l
dGEgbmFtZT0iR2VuZXJhdG9yIiBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQg
bWVkaXVtKSI+DQo8c3R5bGU+PCEtLQ0KLyogRm9udCBEZWZpbml0aW9ucyAqLw0KQGZvbnQtZmFj
ZQ0KCXtmb250LWZhbWlseTpQTWluZ0xpVTsNCglwYW5vc2UtMToyIDIgNSAwIDAgMCAwIDAgMCAw
O30NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6
MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1mYWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7
DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAyIDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZh
bWlseToiXEBQTWluZ0xpVSI7DQoJcGFub3NlLTE6MiAxIDYgMSAwIDEgMSAxIDEgMTt9DQovKiBT
dHlsZSBEZWZpbml0aW9ucyAqLw0KcC5Nc29Ob3JtYWwsIGxpLk1zb05vcm1hbCwgZGl2Lk1zb05v
cm1hbA0KCXttYXJnaW46MGluOw0KCWZvbnQtc2l6ZToxMS4wcHQ7DQoJZm9udC1mYW1pbHk6IkNh
bGlicmkiLHNhbnMtc2VyaWY7fQ0Kc3Bhbi5FbWFpbFN0eWxlMTcNCgl7bXNvLXN0eWxlLXR5cGU6
cGVyc29uYWwtY29tcG9zZTsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsc2Fucy1zZXJpZjsNCglj
b2xvcjp3aW5kb3d0ZXh0O30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9y
dC1vbmx5Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIixzYW5zLXNlcmlmO30NCkBwYWdlIFdvcmRT
ZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBpbjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4g
MS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0KCXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0
eWxlPg0KPC9oZWFkPg0KPGJvZHkgbGFuZz0iRU4tVVMiIGxpbms9IiMwNTYzQzEiIHZsaW5rPSIj
OTU0RjcyIiBzdHlsZT0id29yZC13cmFwOmJyZWFrLXdvcmQiPg0KPGRpdiBjbGFzcz0iV29yZFNl
Y3Rpb24xIj4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkhpLCA8bzpwPjwvbzpwPjwvcD4NCjxwIGNs
YXNzPSJNc29Ob3JtYWwiPiZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBNeSBtZXRh
LWZpaSBhcHByb3ZlZCBhbmQgbWVyZ2VkLiBDYW4gYW55b25lIGhlbHAgdG8gbWFrZSB0aGUgbWV0
YS1maWkgYXMgYSBzdWJ0cmVlIG9mIHRoZSBvcGVuQk1DIG1hc3Rlcj88bzpwPjwvbzpwPjwvcD4N
CjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1z
b05vcm1hbCI+PG86cD4mbmJzcDs8L286cD48L3A+DQo8ZGl2Pg0KPHAgY2xhc3M9Ik1zb05vcm1h
bCI+LS08bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPkJlc3QgUmVnYXJkcy48
bzpwPjwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3JtYWwiPjxvOnA+Jm5ic3A7PC9vOnA+PC9w
Pg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+TGFuY2Vsb3QgS2FvPG86cD48L286cD48L3A+DQo8cCBj
bGFzcz0iTXNvTm9ybWFsIj48bzpwPiZuYnNwOzwvbzpwPjwvcD4NCjxwIGNsYXNzPSJNc29Ob3Jt
YWwiPkNBQkcvRmlpPG86cD48L286cD48L3A+DQo8cCBjbGFzcz0iTXNvTm9ybWFsIj5VUyA6ICsx
LTI4MS02NTUtMjY2ODxvOnA+PC9vOnA+PC9wPg0KPHAgY2xhc3M9Ik1zb05vcm1hbCI+ZS1tYWls
IDogbGFuY2Vsb3Qua2FvQGZpaS11c2EuY29tPG86cD48L286cD48L3A+DQo8L2Rpdj4NCjwvZGl2
Pg0KPC9ib2R5Pg0KPC9odG1sPg0K

--_000_101AF30508944AE98FD92FF0B4F09A81fiiusacom_--
