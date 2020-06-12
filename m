Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E941F912E
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 10:16:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lkgf5bRLzDqWH
	for <lists+openbmc@lfdr.de>; Mon, 15 Jun 2020 18:16:30 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=nam04-sn1-obe.outbound.protection.outlook.com
 (client-ip=40.107.70.43; helo=nam04-sn1-obe.outbound.protection.outlook.com;
 envelope-from=supreeth.venkatesh@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-amdcloud-onmicrosoft-com header.b=wd2jjZge; 
 dkim-atps=neutral
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700043.outbound.protection.outlook.com [40.107.70.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49k1qz2FXCzDqww
 for <openbmc@lists.ozlabs.org>; Fri, 12 Jun 2020 23:32:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j3eHOgyg2Zjtp5tBzQ4qZeYH6iOBO/ConnAn7l4obtgMd5cMjhsEmX7OjDzD60ri4+8OkxQGC9A4sjVfJhE+ocgk9TQcz1eQYKEz0tX8bFKrIvBsFkkkFNpDv0cW9W7gU260DcwYEvyxeS+hzcCosDJCFJOVzCfycLIviUo30UKQdQUDfGTwPvUA1i47Va8Jb62XE9YcwF3GimuDlLA33//wXGQnTIg2j6hcPlBU8isUmw2dXLaVg14vR6Ne/vC6fD2knLVYJEpPuXviJdjWicKF4/Ged1583LLJ6LtD4P7chMCCdONOUvdyCoj2PWjsWkIHKQcyxmIvG6ZlPGtPXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCOORMJzkGBy6WWDaWTunef6dQ7z/N2sLCUPS2GFwqI=;
 b=Zm4ufAamLj3SVEfj6ImWh+ku8E1MMUKZFucmIIkMD6sptgQEgSXsiupLkiAmOh0RbasfuKxYMBdgi5wTMemaWfhq433qVnWMaqZHpEUZ02RPa9EgB1tUKVvnPv1GJty1dpoOb5yt0kHfxAUtOnKkT0kNrr4yeqkZM/txb+/ouIboX1+hguJVASQ3l+Jr1KbzFeHtxiRzzCtEy1N2uuUbdO9z+f5XkQAsqvAm60Y3h+XRZHOvqjbFHBMWLuUrsxLYxX+zezgXN5NaBKXUZi6xZCVQJ00pQ44SCFZoMbznhbO1bQT8/d7XoGvd7X7aEX2nyqq4ZEUOMeNtSFxLw14gPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCOORMJzkGBy6WWDaWTunef6dQ7z/N2sLCUPS2GFwqI=;
 b=wd2jjZgeh1TYH09YMVdyfdC1+YcVVz5pXKbs4OEcVK3l+MGrJ3Ekgylg7akm3Ci8MXRZKMly7JhwYUrdZ9UfGDq9PuPp/RdCyBkLlNY65zMCbUYaFW57k7441XlTj+Rh2KR6WvavDCfSv5Wnud+k5X1K4XfNKORwRYWnb4UdsCE=
Received: from SN1PR12MB2542.namprd12.prod.outlook.com (2603:10b6:802:26::28)
 by SA0PR12MB4574.namprd12.prod.outlook.com (2603:10b6:806:94::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Fri, 12 Jun
 2020 13:32:38 +0000
Received: from SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::2571:49d:affd:c175]) by SN1PR12MB2542.namprd12.prod.outlook.com
 ([fe80::2571:49d:affd:c175%4]) with mapi id 15.20.3088.022; Fri, 12 Jun 2020
 13:32:38 +0000
From: "Venkatesh, Supreeth" <Supreeth.Venkatesh@amd.com>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>, Mike Dolan
 <manager@lfprojects.org>
Subject: RE: AMD's Signed CCLA
Thread-Topic: AMD's Signed CCLA
Thread-Index: AdY/MKmLvWwwQ29BR0ihLnuZG1S+MwA/h7uAAAJwJlAAHexzAAADUqOw
Date: Fri, 12 Jun 2020 13:32:38 +0000
Message-ID: <SN1PR12MB25422A87C02D3CFB3B28784496810@SN1PR12MB2542.namprd12.prod.outlook.com>
References: <SN1PR12MB25428FA4CD525DF87AC73F8496830@SN1PR12MB2542.namprd12.prod.outlook.com>
 <CALVHhecYnixzFTgxbFTcYcgTQNh8JSZpikBnmj4RDo2dax63sg@mail.gmail.com>
 <SN1PR12MB2542B7316775ABE7C8F5033F96800@SN1PR12MB2542.namprd12.prod.outlook.com>
 <a32b29c96cbfca3a005a5370b66087014b225d87.camel@fuzziesquirrel.com>
In-Reply-To: <a32b29c96cbfca3a005a5370b66087014b225d87.camel@fuzziesquirrel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-12T13:30:19Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=14c34c3e-38dc-4a21-b9d9-00004a0b94e6;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-12T13:32:37Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 9705c9c7-f050-4bc8-bd39-000010c05e10
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: fuzziesquirrel.com; dkim=none (message not signed)
 header.d=none; fuzziesquirrel.com; dmarc=none action=none header.from=amd.com; 
x-originating-ip: [99.185.131.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6c9b43ca-4f66-4826-85e6-08d80ed5130c
x-ms-traffictypediagnostic: SA0PR12MB4574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB4574D76D503737E4CC757BF596810@SA0PR12MB4574.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4w0vuPPLPV4EbOOb8/Jss+FJbOWuXk94FBn1ede3SYOJ5AWiRQ2lQEa4J4D60iBtI4z+Ieat/Xw7VaGTmiyZCMy9eytm3M3nY/IEugnKBnsmk7i/JFgUK3qD2HqZQJXJgOHNTa7UGF9tvGCoViTGBmklt5v8bTHYSmlD7+9tyTKZCW1zNmbgH6Mql/Wedmnc0Tc9uoMl3cVo4vja15h9EV6MhCDw/Hk8Fng876EZ0uPMkeRvW9WMSvYVjmQUJFwLl3Jxs9Jme20hqeV1F1znDxKvyOOspRI8Yy3+g5CJ+Lz29BY2x5UxqVlMPZedID+aTM4wjFgPI6Ff5yuQJgja5Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(396003)(39860400002)(366004)(346002)(376002)(136003)(71200400001)(66446008)(2906002)(66556008)(8676002)(66946007)(64756008)(55016002)(53546011)(6506007)(7696005)(8936002)(33656002)(186003)(4744005)(52536014)(5660300002)(3480700007)(76116006)(26005)(4326008)(110136005)(86362001)(66476007)(9686003)(54906003)(83380400001)(316002)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: uKSK+e6G4NCnAXGgtGj/Z0MDtKA1JGd+eEY+Yibrg8Es/iOFBOlIbhk/txgLMghE2fw5e4WqgJYve7yC3MhJvnZYYIu+XHV1K+2u+hxIXTCLnkm+1yt7YAk6BXefLd5kUkzxFiIYbpenDEXxs0uqgYoIvpdvzaWNWYNQQhLWUckrraKDA9J5vNMDfuEftQ/vXzDvHdMZoQxcjwfargiOup8RB2Ro3DC9okI4gqkYolMKGsjBeLq6xyCrPd+A3Sonu5GGPjV3KhwZOBj08WkcE96QoF9seKwCGypM5UQIv6pqeZ7uM1X+E/jjqnKcalZ3sDXGpDef+sT1K8mxiKC/A+rhv9ykDseKfUZ3od/0cNoqIoO3aT5ofGnGg3RFPmn0tn3rbEtQIEYsfwIrwMbkGCd6TTKgVmxmzxVavfRXysnA5neRPLezI4neH17ZicjueR+WMgDjpirobvz//H8Tjpgh0nd5QXPaQGaIseYxacU5RSAGolFJWV1ECFlxSuyZ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c9b43ca-4f66-4826-85e6-08d80ed5130c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 13:32:38.2756 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UDpEzPYBVMpCv14tFt/Q04vYV/tvRoTmlqjNKZOyQnoZjTzb36/DzfSwoOfQsvvCkkSi9bq+ikNpJyre0U0rFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4574
X-Mailman-Approved-At: Mon, 15 Jun 2020 18:15:52 +1000
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "kurt.r.taylor@gmail.com" <kurt.r.taylor@gmail.com>, "Stephens,
 Christie" <Christie.Stephens@amd.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

W0FNRCBQdWJsaWMgVXNlXQ0KDQpUaGFua3MgQnJhZC4gDQpXb3chIEl0IHdhcyBzdXBlci1mYXN0
Lg0KDQpTdXByZWV0aCBWZW5rYXRlc2gNClN5c3RlbSBNYW5hZ2VhYmlsaXR5IEFyY2hpdGVjdMKg
wqB8wqDCoEFNRA0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEJyYWQgQmlzaG9w
IDxicmFkbGV5YkBmdXp6aWVzcXVpcnJlbC5jb20+IA0KU2VudDogRnJpZGF5LCBKdW5lIDEyLCAy
MDIwIDY6NTUgQU0NClRvOiBWZW5rYXRlc2gsIFN1cHJlZXRoIDxTdXByZWV0aC5WZW5rYXRlc2hA
YW1kLmNvbT47IE1pa2UgRG9sYW4gPG1hbmFnZXJAbGZwcm9qZWN0cy5vcmc+DQpDYzogb3BlbmJt
Y0BsaXN0cy5vemxhYnMub3JnOyBrdXJ0LnIudGF5bG9yQGdtYWlsLmNvbTsgU3RlcGhlbnMsIENo
cmlzdGllIDxDaHJpc3RpZS5TdGVwaGVuc0BhbWQuY29tPg0KU3ViamVjdDogUmU6IEFNRCdzIFNp
Z25lZCBDQ0xBDQoNCltDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0NCg0KT24gVGh1LCAyMDIwLTA2
LTExIGF0IDIxOjM5ICswMDAwLCBWZW5rYXRlc2gsIFN1cHJlZXRoIHdyb3RlOg0KPiBbQU1EIFB1
YmxpYyBVc2VdDQo+DQo+IFRoYW5rcyBNaWtlLg0KPg0KPiBCcmFkLA0KPiBDYW4geW91IHBsZWFz
ZSBoZWxwIGNyZWF0ZSBtZXRhLWFtZD8NCg0KbWV0YS1hbWQgY3JlYXRlZCENCg0KLWJyYWQNCg==
