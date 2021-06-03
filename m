Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E131439A3A0
	for <lists+openbmc@lfdr.de>; Thu,  3 Jun 2021 16:47:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwpf60NVZz300S
	for <lists+openbmc@lfdr.de>; Fri,  4 Jun 2021 00:47:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256 header.s=selector1 header.b=BR9NFM20;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=keysight.com (client-ip=205.220.161.93;
 helo=mx0a-003cac01.pphosted.com; envelope-from=mahesh.kurapati@keysight.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=keysight.com header.i=@keysight.com header.a=rsa-sha256
 header.s=selector1 header.b=BR9NFM20; 
 dkim-atps=neutral
Received: from mx0a-003cac01.pphosted.com (mx0a-003cac01.pphosted.com
 [205.220.161.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwpdk3Jcgz2yX8
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jun 2021 00:47:21 +1000 (AEST)
Received: from pps.filterd (m0187212.ppops.net [127.0.0.1])
 by mx0b-003cac01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 153Ehq85008435; Thu, 3 Jun 2021 07:47:18 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2042.outbound.protection.outlook.com [104.47.74.42])
 by mx0b-003cac01.pphosted.com with ESMTP id 38wj0xvbb9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 07:47:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DKXy7xhsCvx5kGCB8Zzq7KYWE6CJf7nbDRZceYGCbaViStBKX3GjCKx6TmGU9V1FhFV3JVcnbUTupveDwXQsKWeRI8hvq3HoK9fKxbluOsbYYKGwIwN8QziSOCGl8pPjSmJShyCy53nKVD3kfKastpXZftorE7vxleMWdEXMLPCbpgid/aKNWHj+RXYR9Ud38i0JDT0QH9SJWdCWeLJUhrYV2ajPdFMGCs2YIGfvJQoTf+2uhKyHZAw/22K1mebmPpiU9vFQR8mxXprj78dqRbfFRnudmY9HjHnf1N13DD7ElMmGEjrmyV7vsCT5YM9Bl8UTJjG3krgi5WowyArkrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u4JcStpZA7ZhU1WxahRh/12HO/FJCktv5QTdYjwjZ8=;
 b=gVTDQ3zyDOlkydTwQj3kq3PlP3QRjLxtktsSIzbDKUh2jL3rughW8zThnFfqWNRiVu+OH8xHpHwoFiyd2S/qXher/CFfeHI0IjqdIucDiIrB8XgOnqSu6HBgIUAC6N6excRkGMUHMLzsa7VdaMfIH6sruVxKWMDBPBf0LVBmhc2Dh3U4uypErClhzp4ZIuld3ubxIdrfVy0DhPujtvTJrlknIfgKRbxWz6KZnmSbdsp4tCzmva9mll+89r1F4CFgzF88BCOeN4nfxu980riyfXVz+juKbrdGgKByVclwY71t/5LDVW7RpqpVYo88F5wOhRIWWmY6gw8jn0k1/JwMlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=keysight.com; dmarc=pass action=none header.from=keysight.com;
 dkim=pass header.d=keysight.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=keysight.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8u4JcStpZA7ZhU1WxahRh/12HO/FJCktv5QTdYjwjZ8=;
 b=BR9NFM20NF81FS8iuTr70DgDZtRNwInKUyyYf6xVNxAI0+2OsFsK2DgQ3k44kgLHFttVCURqOjnHBC+K7NpPUmNgFTqUwWv5vnUbKmmy1awaAa/cRwnhxBakMWVuUvFGNZVwOYHTG5BmVF/alsk0Fp77FHbR1hI7F2IOA1jyx/Y=
Received: from SA1PR17MB4593.namprd17.prod.outlook.com (2603:10b6:806:190::21)
 by SA1PR17MB4866.namprd17.prod.outlook.com (2603:10b6:806:19d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.23; Thu, 3 Jun
 2021 14:47:16 +0000
Received: from SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::3480:caf8:88f2:3f8c]) by SA1PR17MB4593.namprd17.prod.outlook.com
 ([fe80::3480:caf8:88f2:3f8c%7]) with mapi id 15.20.4195.023; Thu, 3 Jun 2021
 14:47:16 +0000
From: Mahesh Kurapati <mahesh.kurapati@keysight.com>
To: Andrei Kartashev <a.kartashev@yadro.com>, "openbmc@lists.ozlabs.org"
 <openbmc@lists.ozlabs.org>
Subject: RE: FruDevice/Entity Manager vs hwmon
Thread-Topic: FruDevice/Entity Manager vs hwmon
Thread-Index: AddUtYbuQlmqjpkgTbmHP6gPOH9bmAAGl2cAAO3IRNA=
Date: Thu, 3 Jun 2021 14:47:16 +0000
Message-ID: <SA1PR17MB4593E3B3D0E29CF8390B79B5963C9@SA1PR17MB4593.namprd17.prod.outlook.com>
References: <SA1PR17MB4593FB6D4BD9F4517F3333DE96219@SA1PR17MB4593.namprd17.prod.outlook.com>
 <4d6fb9a7edd4a27be17aca804a189f92b15abd9a.camel@yadro.com>
In-Reply-To: <4d6fb9a7edd4a27be17aca804a189f92b15abd9a.camel@yadro.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: yadro.com; dkim=none (message not signed)
 header.d=none;yadro.com; dmarc=none action=none header.from=keysight.com;
x-originating-ip: [23.114.58.132]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cb9842b4-ac89-43ee-c2f2-08d9269e7b46
x-ms-traffictypediagnostic: SA1PR17MB4866:
x-microsoft-antispam-prvs: <SA1PR17MB486680925A519482D1C86F5E963C9@SA1PR17MB4866.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8QLTYRKBy1Z7KM32pLHXoj8Z5Pq7xms1cI3vZARqiDYqf/WW4t1n+PkPV4tY+ObYWGYrByU86lY5aPxQlf8593aD+xPZDIbfDkB+BqJrC2dRrcmNJV0B572/+7EOqKvavmRbhFMcMntQHjrffsLnnlYnVONDaD3dC4fGckGgQntb24RxqPKDaC/wnckF5fpKa02ZJDoFp901wEMj0b6RIki7bA8m2ROViY7K87A1XbFDGSXjlEFGDii8SpMeCIQR4LVFKLoLoIMWJj0E1dOLbl9yWAHzOZBjt0e8T/9hs/mYkr8W8lDqiDJmNiaIyR7Clpaq6BYVRjURJW/xq7+AV+ZKIxWyGt+A0J0kQ2WTPwwBs91XHPrpDO+3KqnFSym0DDV1WE95PPuyucBo4DarQ+zD+F5JaF9sY14Tsc6FgrcwcIzc91tpVe0EuAbArRQgqGd2NHPBuAqaEzMA4UZsG4TJX9XrMglTseu6GAkWarbB6uwq3UskSghGB08d+7Shq/+URRbAi/Bv/EwPi2L0jQLVdajxjVXuAiY7Ct80Lt1HMLHD+8Chds68HK3xub9F46vhh1A5aPP9jxndobM81jqazrCDvH4DO4I5NG1jhq9/cWUzxSkLC2N8rg974wEqFcqIdEpGui9wGtMZm5yPSWLdn6Xmwu/m6WxjYK0SfYp6vyfOfu70/T6t12uTJFc0kBamqnYdKeK3kyOgoD8fgKzdhExbIbsk9diMOk31waM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR17MB4593.namprd17.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(366004)(376002)(39850400004)(66556008)(110136005)(66476007)(66946007)(44832011)(55016002)(66446008)(3480700007)(8676002)(86362001)(33656002)(64756008)(9686003)(53546011)(316002)(186003)(26005)(8936002)(7696005)(76116006)(966005)(478600001)(6506007)(83380400001)(71200400001)(5660300002)(122000001)(38100700002)(2906002)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TUx2QjJCWTRBbGJlS0lxUW1kbEIvUkxSYmNNMld2SlBHazRKSnkyMGEvVUgy?=
 =?utf-8?B?REVSd212cDZ1d2d2Wk0vTU1zc0xOOVJtdDVHOHRLM3FQVlJ5UXJkVlpFd2Fi?=
 =?utf-8?B?T2FYbTc0ZUFLQ3oxS3hGQXhUZFBFaDIzWjBqZXUxU1NLWm9KbjlOWVdRQStW?=
 =?utf-8?B?cExlaUtSM3dkaHNLbnpMZ0s0eEJ0YStFcWJVanF6SUZpT3haZ1I5RG9BS21a?=
 =?utf-8?B?a3h5UDY2cDF0VXBKZWFoMWZnNXNWODF1YkRvYXZuRlBHQ0Z5aXovSmh0eE41?=
 =?utf-8?B?UG1XSWJnbjdMN1pTSVVNazJweURETkZnQWtGTFpBM0JiY29naVo2c25TeXBi?=
 =?utf-8?B?OTRwNWhkcENLTzlqc05aRkgvVVFCV21LYjNyUGdoRjE1ZHRTSkFRUklqYS9y?=
 =?utf-8?B?cXR1SGR2RmxENndCVWkvRUdITDI3bFFSeDVMTlJNbTl6ZkhoTTBSMHE5RGJ5?=
 =?utf-8?B?NUptU0FERUFyaFpKWXE5dWx3Z3puVDFYTmFiY2Z0cU10S2RJcTZsNmlNdFF6?=
 =?utf-8?B?OUtNNlAzaitYNEZEWUVML3EwYm5OUUZwWEV5L3lrNFpjd29tbXB5ajRjd1h6?=
 =?utf-8?B?Uk9XSWNGT2FuemcvR1djcDFxTUlBYkwzSVJpekE2QTBYMnhQdHcxK3E0WUxJ?=
 =?utf-8?B?aldwbU1lS3FLaFpVN0tvU0thMDRZcHB5bmJYcFZvcmV1eXhjM2xUc3pEYzJG?=
 =?utf-8?B?WGRWdllXVDIvUU9ici9qWnJZNHlRaFVXcWR6R0h2RVVzbjBsVDF3Umt0MElF?=
 =?utf-8?B?S3ZMcHY4RmZzeGhJUEFnSkNCdGFWK0VCNk91NkN5K29JSjZQbENsMjIzQ0Y4?=
 =?utf-8?B?SHZJWWFndnV3alkrazJ4b3NnYWVSRzNPZnZwQ1lLdk1mamtBZEZheFlvc0VO?=
 =?utf-8?B?bGcrOHdCdDZwUXR5NkhQT29KUGxVQVExT3lVNjhlbWp3S3E5a2NRcXI5Z294?=
 =?utf-8?B?YjVjK05Yd0p3c1FwcWtzRW1kWUJBLzJ0VkF3S3I1eGVMY1V2eVpTQXBXM0l3?=
 =?utf-8?B?b1oxNXlpZEhwUVNOdEhZdCszd2RPWWE5Z08zZHkyb3FQTTkzWmthWDhHd0hq?=
 =?utf-8?B?enNrNERtWDF3VzhvMkx2ckJEZXVqUHYxS1p4cFB1Q1RCMGlMVWV1dCt5QnVH?=
 =?utf-8?B?K2QrTEE3Qk92Z0Q4amc0Qy9IbFk4VEplcVU1T3JCNWpVZGhtN0M0MTdBOW53?=
 =?utf-8?B?aG51R0FhcnYzVEJoV2tWQlhVTmp4emRVakFWdXVUcFYxekkySVhTNjVNME1S?=
 =?utf-8?B?K0JZZ0N1L2RPd3ZEaGlzNlRydzc3ZTBsb0Fyc0t4S2g3cWpIdUtIZnI5OGs4?=
 =?utf-8?B?V1IxZXNpbTZCY1RRcFFDSTZ2N3ZyS3pJZmFLeS9CQWdPb1grK1VadDl2QUVN?=
 =?utf-8?B?bXRLQ2U1MXQ2Mi9aL3hLTURBZFEwNkZOcnI0eGhqRFQyTHB4WEZnMXZqR0pz?=
 =?utf-8?B?WlNWYWh5UzA2NjB2Umh6VDhCTTRxeDlBUjhwVWxrTVI4S21CN0dkZ1JQWFo1?=
 =?utf-8?B?VUZkVkRWWkNvMHRZa3ZSQzdoSHJVcW9qSlk1a3A4Tmk2SzljeG5DTHBNMWtU?=
 =?utf-8?B?dUhIWG50RWlwYVhIcUR5Mlk3R2NQYVM5SE40WHpNdzhiSkxweEhqQU5LL2RS?=
 =?utf-8?B?ZzUrdm5TUXdLaG1Pam9QcEdhRU1uYXo1UjA1MUZ4Rnl3V2ovZGxMK1BCK2Vm?=
 =?utf-8?B?ZGpZUVhjbjFPQ2MzNG1xM0NzY2NLd2pIL2pUcEp6T0FFTnRINUpJdUpFamx5?=
 =?utf-8?Q?Ah8xVZsvLGu2La7FtD2s/+3g5JCq+MtkXSVTsl8?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: keysight.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR17MB4593.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9842b4-ac89-43ee-c2f2-08d9269e7b46
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2021 14:47:16.3175 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63545f27-3232-4d74-a44d-cdd457063402
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRhEzY6Z/S442eYPgNnhfpxFp6jU4MsS1sHp3quRqVRFx/noxO2Mc4BZ+j/n2I19Uos+e3gHPwn+X3s54VAAtuiTGb8H+GeHJYyleQj3NVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB4866
X-Proofpoint-ORIG-GUID: lOef3B2rteuvPRNS7oym3kjfdUfbApIm
X-Proofpoint-GUID: lOef3B2rteuvPRNS7oym3kjfdUfbApIm
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-03_09:2021-06-02,
 2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030101
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

SGVsbG8gQW5kcmVpLCANCg0KVGhhbmsgeW91IGZvciB0aGUgZXhwbGFuYXRpb24uIEkgdW5kZXJz
dG9vZCB0aGF0IEkgbmVlZCB0byBkZXNjcmliZSBzZW5zb3JzIGluIHRoZSBqc29uIEVNIGNvbmZp
Z3VyYXRpb24gZmlsZSBvZiB0aGUgRlJVLCBub3QgaW4gdGhlIEZydURldmljZS4gIA0KDQpNYWhl
c2gNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFuZHJlaSBLYXJ0YXNoZXYg
PGEua2FydGFzaGV2QHlhZHJvLmNvbT4gDQpTZW50OiBTYXR1cmRheSwgTWF5IDI5LCAyMDIxIDQ6
MTcgUE0NClRvOiBNYWhlc2ggS3VyYXBhdGkgPG1haGVzaC5rdXJhcGF0aUBrZXlzaWdodC5jb20+
OyBvcGVuYm1jQGxpc3RzLm96bGFicy5vcmcNClN1YmplY3Q6IFJlOiBGcnVEZXZpY2UvRW50aXR5
IE1hbmFnZXIgdnMgaHdtb24NCg0KQ0FVVElPTjogVGhpcyBtZXNzYWdlIG9yaWdpbmF0ZXMgZnJv
bSBhbiBleHRlcm5hbCBzZW5kZXIuDQoNCkhpIE1haGVzaCwNCg0KWW91IHJpZ2h0IHRoYXQgdXNp
bmcgRU0rZGJ1cy1zZW5zb3JzIHlvdSBjYW4gZHluYW1pY2FsbHkgYWRkIHNlbnNvcnMgd2hlbiB0
aGV5IGFyZSBkZXRlY3RlZC4gQnV0IGl0IHNlZW1zIHlvdSBoYXZlIGtpbmQgb2YgbWlzdW5kZXJz
dGFuZGluZyBhYm91dCBGcnVEZXZpY2UuIExldCBtZSBleHBsYWluIGEgYml0Og0KDQpFTSBpcyBr
aW5kIG9mICJjb25maWd1cmF0aW9uIG1hbmFnZXIiLiBNYWluIGZ1bmN0aW9uIG9mIEVNIGlzIHRv
IGxpc3RlbiBkYnVzIGFuZCBtYXRjaCBhcHBlYXJpbmcgb2Ygc29tZSByZXNvdXJjZXMuIEluIHJl
YWN0aW9uIG9mIHRoaXMgbWF0Y2hlcyBFTSBleHBvc2VzIHRvIGRidXMgc29tZSBvdGhlciByZXNv
dXJjZXMgd2l0aCBjb25maWd1cmF0aW9uIHdoaWNoIHVzZWQgYnkgb3RoZXIgZGFlbW9ucy4gQWRk
aXRpb25hbGx5IHRvIHRoaXMsIEVNIGNhbiBpbnN0YW50aWF0ZSBkZXZpY2VzIChzZW5kIG5ld19k
ZXZpY2UgY29tbWFuZCB0byBrZXJuZWwgZHJpdmVyKS4NCkVNIGl0c2VsZiBjYW4gb25seSBkZXRl
Y3QgZGJ1cyBlbnRpdGllcyBhbmQgdGhlcmUgYXJlICJkZXRlY3Rpb24gZGFlbW9ucyIgdG8gdGVs
bCBFTSB0aGF0IHRoZXJlIGlzIHNvbWUgaGFyZHdhcmUgYXZhaWxhYmxlLiBGcnVEZXZpY2UgaXMg
b25lIG9mIHRoaXMgImRldGVjdGlvbiAgZGFlbW9ucyIgd2hpY2ggc2NhbnMgSTJDIGJ1cyBsb29r
aW5nIGZvciBFRVBST01zIHdpdGggSVBNSSBGUlUgZGF0YS4gVGhhdCBpcyBob3cgeW91IGRldGVj
dCBiYXNlYm9hcmQsIFBTVXMgYW5kIHVuaXRzLCBidXQgaXMgeW91IHNlbnNvcnMgZG9uJ3QgaGF2
ZSBGUlUsIHlvdSBuZWVkIHRvIGltcGxlbWVudCBvdGhlciBkZXRlY3Rpb24gbWVjaGFuaXNtLg0K
VHlwaWNhbGx5IHlvdSBoYXZlIHkgc2Vuc29ycyBtb3VudGVkIG9uIGJhc2Vib2FyZCwgc28geW91
IG5lZWQgdG8gZGVzY3JpYmUgdGhlbSBpbiBFTSBjb25maWcsIG5vdCBpbiBGcnVEZXZpY2UuDQpO
b3RlIHRoYXQgdXNpbmcgRU0gZG9lc24ndCBleGNsdWRlIGRlZmluaW5nIHNlbnNvcnMgaW4gZGV2
aWNlIHRyZWUgLSB5b3Ugc3RpbGwgY2FuIGRvIHRoaXMgaWYgeW91IHdhbnQuDQpGb3IgbGlzdCBv
ZiBzdXBwb3J0ZWQgZGV2aWNlcywgdGhhdCBjYW4gYmUgaW5zdGFudGlhdGVkIGJ5IEVNLCBzZWUg
aHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2Vu
dGl0eS1tYW5hZ2VyL2Jsb2IvbWFzdGVyL2luY2x1ZGUvZGV2aWNlcy5ocHAqTDQ4X187SXchIUk1
cFZrNExJR0FmbnZ3ITBXOXFzOGd3cXdSeWpCZmNVZUlDLVZnX2dzSzZkdFBxVzBXcGN3aTdjUVM0
TUtheU16dTlvbGlvamFYaFRzVnZKZGJST3ckDQoNCg0KT24gU2F0LCAyMDIxLTA1LTI5IGF0IDE5
OjEzICswMDAwLCBNYWhlc2ggS3VyYXBhdGkgd3JvdGU6DQo+IEhlbGxvLA0KPg0KPiBJIHdhbnQg
dG8gZGVmaW5lIHRlbXBlcmF0dXJlIHNlbnNvcnMsIGZhbnMgYW5kIFBTVXMgZm9yIG91ciBuZXcg
DQo+IHBsYXRmb3JtLiAgR29pbmcgdGhyb3VnaCB0aGUgZG9jdW1lbnRhdGlvbiBhbmQgc291cmNl
cywgIEkgdW5kZXJzdGFuZCANCj4gdGhhdCB0aGVyZSBhcmUgdHdvIGFwcHJvYWNoZXMuICBPbmUg
aXMgdG8gZGVmaW5lIHRoZW0gd2l0aCB0aGUgc2FtZSANCj4gaTJjIHBhdGggYXMgbWVudGlvbmVk
IGluIHRoZSBkZXZpY2UgdHJlZSBhcyBwYXJ0IG9mIHRoZSBod21vbiANCj4gY29uZmlndXJhdGlv
biwgYW5kIHRoZSBvdGhlciBhcHByb2FjaCBpcyB0byBkZWZpbmUgYSBqc29uIGZpbGUgd2l0aCAN
Cj4gYXBwcm9wcmlhdGUgcHJvYmUgaW4gdGhlIGVudGl0eS1tYW5hZ2VyL2NvbmZpZ3VyYXRpb25z
IGZvbGRlciBzbyB0aGF0IA0KPiB0aGUgRnJ1RGV2aWNlIGFuZCBFbnRpdHkgTWFuYWdlciBhcHBz
IGRldGVjdCB0aGUgZGV2aWNlcyBhcyBwZXIgdGhlIA0KPiBwcm9iZSBhbmQgY3JlYXRlIHRoZSBt
YXRjaGluZyBkYnVzIG9iamVjdHMsIHdoaWxlIHRoZSBkYnVzLXNlbnNvcnMgZG8gDQo+IHRoZSBp
bnN0cnVtZW50YXRpb24uICBXaXRoIGVudGl0eSBtYW5hZ2VyIGFwcHJvYWNoIEkgdW5kZXJzdGFu
ZCB0aGF0IA0KPiB0aGUgaTJjIGRldmljZXMgYXJlIGNyZWF0ZWQvcHJvYmVkIHdoZW4gdGhleSBh
cmUgZGV0ZWN0ZWQuICBNeSANCj4gcXVlc3Rpb25zIGlzIHdlIGRvbuKAmXQgbmVlZCB0aGUgZGV2
aWNlIGRlZmluZWQgaW4gdGhlIGRldmljZSB0cmVlIGZpbGUgDQo+IGlmIEkgZ28gYnkgdGhpcyBh
cHByb2FjaD8gSSB1bmRlcnN0YW5kIHRoYXQgdGhpcyBoZWxwcyB0aGUgZHluYW1pYyANCj4gZGV0
ZWN0aW9uIG9mIHRoZSBGUlUuICBBbHNvIHdlIGhhdmUgTE03MywgYW5kIG90aGVyIHRlbXAgc2Vu
c29yIA0KPiBUTVA0MzFjIHRoYXQgaXMgbm90IGRlZmluZWQgaW4gdGhlIEZydURldmljZSByZWNv
cmQgbWFwLiAgTmV4dCANCj4gcXVlc3Rpb24gaXMgZG8gSSBuZWVkIHRvIGFkZCBzdXBwb3J0IGZv
ciB0aGUgTE03MyB0bXA3NU1QNDMxQyBhbmQgDQo+IG90aGVyIG9uZSBpbiB0aGUgRnJ1RGV2aWNl
IHNvIHRoYXQgaXQgZ2V0cyBjcmVhdGVkIHByb3Blcmx5PyBDYW4gSSB1c2UgDQo+IGFueSBleGlz
dGluZyBzdHJpbmdzL21hcHBpbmcgZm9yIHRoZXNlIHNlbnNvcnM/ICBUaGlzIGlzIG5vdCBuZWVk
ZWQgaWYgDQo+IEkgZGVmaW5lIHRoZSBlbnRyaWVzIGluIHRoZSBkZXZpY2UgdHJlZSwgYW5kIGlu
dGVncmF0ZSB3aXRoIGh3bW9uIEkgDQo+IGhhdmUgZXZlcnl0aGluZyBuZWVkZWQuICBJIHNlZSB0
aGF0IGh3bW9uIGFuZCBGcnVEZXZpY2UvRW50aXR5IA0KPiBNYW5hZ2VyL2RidXMtc2Vuc29ycyBw
cm92aWRlIHNpbWlsYXIgZnVuY3Rpb25hbGl0eS4gIENhbiBJIGhhdmUgYm90aCANCj4gb2YgdGhl
c2Ugc2VydmljZXMgcnVubmluZyBhdCB0aGUgc2FtZSB0aW1lIG9uIHRoZSBCTUM/IFdpbGwgaXQg
Y2F1c2UgYW55IGNvbmZsaWN0cz8NCj4gIFBsZWFzZSBoZWxwIG1lIHVuZGVyc3RhbmQuDQo+DQo+
IFRoYW5rIHlvdSwNCj4gTWFoZXNoDQoNCi0tDQpCZXN0IHJlZ2FyZHMsDQpBbmRyZWkgS2FydGFz
aGV2DQoNCg0K
