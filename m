Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 994FF720ED0
	for <lists+openbmc@lfdr.de>; Sat,  3 Jun 2023 10:50:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QYD8W0VB8z3dsl
	for <lists+openbmc@lfdr.de>; Sat,  3 Jun 2023 18:50:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QZkufqeW;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f400:7eb2::610; helo=nam02-bn1-obe.outbound.protection.outlook.com; envelope-from=ropai@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=QZkufqeW;
	dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on20610.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eb2::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QYD7v75J4z3cLx
	for <openbmc@lists.ozlabs.org>; Sat,  3 Jun 2023 18:49:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fXaY5gXAoEAryKVIU1W45bTZU1Ep6x9ETjixFGKpW7wzq0Qv+KyNUKsqthLHASozS+CHrX469EY9J1XbI2/wzPpQTkIeND/jvqetmm4yXT4acR8AYAWd/DsOLgNfyioKCi0cbhMvgWDoheHOVmSzOcxIXiw0EOQvvHeH8LN2NPBIbW3HK1Iw39M86D1/pR8l2rdJK+94jmvlfRWYqMlo+V8rk8BMFi8cHkVsH54mfgS6zKeQl8zGf8ysQBAdbgAtPBGBdlurhTsoHWyApWkWbIKsBxLkX0ur16B307HxjBjWYB4dCZN9g5WiroNahLpCVZxbEcFt4LEuD1BqLp408g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dLxkAD2znUwWz3FWQRMuybHySH10GdD+VOpQl6gvgwg=;
 b=WB4ShDr4HhOwyYtwwo0oheslS8+mEYFo9VuDz/fEDMUM/mwUGDMIShPzEakgNXxXbb5V21NKSGrNYvBsUYUOLwWiOPp/qdeixu7pgNuQVD/w82iiSX2WoiVJBU3yb2jPn/9iV4807hy83ToKczqdGfYf50TGG/qBPHiS57CwUHrmEhcnZv69cSTiWI/nTOtEe5e3S7pUir3oo2w7QMLM6OoF9Xf0GCgpgPzS/0EQkiybwzFxjx6zWcA7KFKNHIbi4L7eudEQNoXOOH0mzrF4JM3H7Vy/BtSdOfIovQ3kG1jJKvI9cNG7DSUjqFMwSb46YEyDTrDenFSNfXiJ652PrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dLxkAD2znUwWz3FWQRMuybHySH10GdD+VOpQl6gvgwg=;
 b=QZkufqeWZTiOUPltOD8OahltJkTocK9onpQwx+OIGg1GYtp0T2Le2VcwyNUhnJ6rWr4q9jV3aqPZcTUrNnW6EpFE4htH5uAqtPDzauWJ/3MCQo8GHt67CN7qsS9Vv0uceVI/ytbcvymHejl3LVup4L1k9rP4PeqnaX/P3tjmijSX5zZ92GJGL+QaClqqh25FKPh/ZYD3ZXFq2LnuRX15LUTlFJGguudx46h8pWoJDD7vxq9S+k/azZX1/07XZTgWxrhVVu7w+PVfyNGZ/CU3vzMm2UdaJ0bHuMNQ2Nn9MUTi+vMF246+lEG5CPRO904AOmlJSFAZCc4w2PV040lWeg==
Received: from LV2PR12MB6014.namprd12.prod.outlook.com (2603:10b6:408:170::18)
 by SN7PR12MB7835.namprd12.prod.outlook.com (2603:10b6:806:328::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Sat, 3 Jun
 2023 08:49:05 +0000
Received: from LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::507:bce:e64c:f3fe]) by LV2PR12MB6014.namprd12.prod.outlook.com
 ([fe80::507:bce:e64c:f3fe%7]) with mapi id 15.20.6455.027; Sat, 3 Jun 2023
 08:49:05 +0000
From: Rohit Pai <ropai@nvidia.com>
To: Ed Tanous <edtanous@google.com>
Subject: RE: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb
Thread-Topic: Prioritizing URIs with tight performance requirement in openBmc
 with bmcweb
Thread-Index: AdmOIj9HMMHUr5E5SWm5E5BqGmJtZAAOkWAAAAMhPIABk6P0AABNnoyQ
Date: Sat, 3 Jun 2023 08:49:04 +0000
Message-ID:  <LV2PR12MB60143B8210EC0B427F219528CD4FA@LV2PR12MB6014.namprd12.prod.outlook.com>
References:  <LV2PR12MB601419E4F59555BBCB4EE70FCD419@LV2PR12MB6014.namprd12.prod.outlook.com>
 <CAH2-KxAdhmj98prJ2QCuN4p1ZxRZs3ZFdchxdZ-_A9c-ACpMOQ@mail.gmail.com>
 <CAH2-KxDfqpMLpeFkKn8BHkL2e7nwVBR+o3ziDBvw3KJd6fHwsg@mail.gmail.com>
 <CAH2-KxAEay+E=D9scS=2pHb7tOw0Vz5_ZoH_5=Q5o6sJdGE1Jg@mail.gmail.com>
In-Reply-To:  <CAH2-KxAEay+E=D9scS=2pHb7tOw0Vz5_ZoH_5=Q5o6sJdGE1Jg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV2PR12MB6014:EE_|SN7PR12MB7835:EE_
x-ms-office365-filtering-correlation-id: 3ad7e484-956a-4866-9dff-08db640f62e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  mWDe52rigE0AUIgbsO1hDChZvBbKITV7VDHpA2gtrlg8T8MuvV7/qtlDbImH8mIp8nW27QuQB3oXlpRzJoiVEgYy1H5QByZ2hmAf+DKU1ApU6Zo6KvOXDDLs0YAaQjuIZU3FAeRQ+OBghiwn769/xJXrW9rDBt+VJfnEYXz415deW2n0MJi6bMJSolrIw5Om+OelC4Sr8c3EIlmn3ILZ8eV+8lbntjNaD+iRW+nABbwiBlVYlBvMd1oMRyJujK8bTaNi1Cvt8sooGWuwvuIyKAoxxrce5zo2u/AhlZyYytYQZrxervBxawD5tLUG7tIbjRADlkhvZL5LQ1qaaONSkuf+Q/Z2JJEiWDj9z+P/Tzk7CgdiPD1+SsOcJOdtKX+CaJIUMD9QZzcKLLUlcw8Z3tgXa7Wl0TQrGz4MiqH/RQKV/hjsyoD7XcBfR2jblVm24yS/l7EdpdHGAtAOMeQ5O3dKE9uM7+hSCEdnB8507Z2YPzGISgdkj8cbtsO5TZxgr9dRtVE2+W4KkAXd0Oj1N2wpKM4+JQPsyx28b37NUfDsptGAn5fDFO7+pGUrvZsexwF5xTZP9wbNU+ZeTSrgglBuq1mW9/UHWSlS5l229eHEXWFN5tD4Oto+jC4Q+3U5t4lVSMRTTPmnoz2FvXWu1CpkQEvXdTbQT8FqvXR512M=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB6014.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199021)(8676002)(33656002)(55016003)(83380400001)(41300700001)(9686003)(122000001)(4326008)(38070700005)(316002)(38100700002)(52536014)(7696005)(86362001)(6506007)(66476007)(66446008)(66946007)(66556008)(71200400001)(64756008)(6916009)(76116006)(2906002)(478600001)(5660300002)(966005)(8936002)(53546011)(26005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T0ViNkFaT29Wb1d0WFIyb0dvNzRXVlgvVXo2aVF5VEdnQXBkVFJOUmt6RGZV?=
 =?utf-8?B?Z3kyNklFajI4QmEyeHhlN1FyczFJSGVPM2xxRnlmWDQ1ZklkMi9CNHJWTHJy?=
 =?utf-8?B?NkVFTjlSaVFLNUloSnFXeEFwNE5LNnRDcnlDMWQ5dU9Zci9aTTd5RXM5YlpL?=
 =?utf-8?B?clFYb1M0VHJRc1E4QUx0dWplbGV4Mm9LRDJUSzdmRFgyR1N5WWE0bExOM1Zj?=
 =?utf-8?B?cUgwclA3b2N3dy8zVkp6eGQ3Y25XSUh2NlZScmZEYlA4SXpxVmFmSnh2OHBV?=
 =?utf-8?B?ZmxDdzBmVUliQ1BjK25BUTgrNlFJV3lmWTZBemxBS3libHl6OEYrZnRjK0ZY?=
 =?utf-8?B?cEtKaVFvREdneTZJdGtKSVBlK01rcmRnMEc4L1pWYkc1enBBZHpla3RmTGk0?=
 =?utf-8?B?V3lwRjk0OG5FQnVOendaNzVBMjlRbUFKZ0JSQ001NlJicU40NVFJUTh1dlNt?=
 =?utf-8?B?YVV6NkxSRTF1YmVOV2d4aWxyZVRsYytvZktuN2VvR2hvdS9kN2g0Q3R2eHBT?=
 =?utf-8?B?a0ZEdWxGcitrQnJScHVMZlY4MjB1YndCNTYvT1U3TThpWXFudTNMdUEybHhl?=
 =?utf-8?B?V2hCNWNXNjNiRkpYL3JnNHZkbGVyYmFIZ2Y5OGZhOFZaNEcwRURwSWJsblZH?=
 =?utf-8?B?YUV1MHVKZUEzbyttUERmNkY3SkNsWmhVMjAvU1NwaVQ0VmxKTlFQVC9JYnM3?=
 =?utf-8?B?Ri9yanNzR3FQQTB1ZzlJdTRkaFNPK09wdmlKOEhlOVdrYW1DWHEzaENlVU1H?=
 =?utf-8?B?LzRORHpMNHAxVHpMNmdSUmpIZ0wvV1cyd0txSElMU2E3TDZBRE5oMGd2NDV4?=
 =?utf-8?B?cDF2NUFCUEJqbVplRUdzb0FmbWl4Mis0UEFSek54OGJiM2xTclhqVTRoUEs3?=
 =?utf-8?B?akpQTkdNeGc2SDNLU05GR1JtZlluYUgrQ2d3WkduMVZ6OEQ0d2gvbzBDZTh6?=
 =?utf-8?B?L2VIM05tdDNLdFBNRXR4ZE5xZXd2aHhiNmMrbDFVckRCZDlEZXFVdFd6dVJZ?=
 =?utf-8?B?TnhocGJsMHVRQkp0aEdBVmk1ODE2ZVVLd1lhOXVRbzJBMkZVVWlsQXQ2V2JJ?=
 =?utf-8?B?TDBIUG9Ob3VOVnRYSWxBditJdDFkSGZPcXdGUk9QaGpFaEJteGJwMmNua2Rl?=
 =?utf-8?B?d2ZXc0NtUGdrMlIzYXBianlENEN6YUpWc2VMbmRXcExNZEdMdnFGa1BwWkhv?=
 =?utf-8?B?bEliZk9uTCtxRmZ2dUNlUmZzV21MZXdjaENhRG5EMTJUcHY5K3BITS95a1R5?=
 =?utf-8?B?bXVvUUpOWThoSmwzVkxRRzFhNThLc1RMUnU5dGRsMkFNQk9lMnhod0JJQndI?=
 =?utf-8?B?Zk9tL3dURDJPWHl2TlJIN0pNQ2RYRkZ6VmIvYmYvUnJwQXZSNlBPUzlhdjJB?=
 =?utf-8?B?UzN6NDN0cW5Ya1A5a2k4c0U5dEtqSmhyMzlQcjNXcDd0Mnh5ZmhYcFFFVExE?=
 =?utf-8?B?V2NSb3djdytocG5SMk5qUGxXdGpST3M0ZzB2UE9TdFpjR1M3bXpmSnorZ3Bw?=
 =?utf-8?B?U0FYTFNNWWFWNDFjZWJLTzZOSlN0SWZETHlDeERrTHVqQk90UEdYUWRab3V6?=
 =?utf-8?B?VTJ2bEpQWmdzdFljemdvK2lXNGpnU2Y2a2V0eWdzVXNpRitwN0VOU0psaWlu?=
 =?utf-8?B?YjgwUVZYanNOcGlucTdPVjE1bk5kT3JUQTh1VVdHQ3I5bWlUL1VDSGVjU3B1?=
 =?utf-8?B?blpjcWZYd1hEYUM0RzVqanh1cDNzVmpUaTl1WXhzZGd3UklIeHN3U2RIa3FB?=
 =?utf-8?B?YkpHTllsYVhWbTFqTDB5VFVramVXcGlqbUFRTWpyVGt5cjlOZ2NveFlSYWZO?=
 =?utf-8?B?ckZHdkVWNUo2ZjBxdGN1RlBTSGgvcmNCK3pkdzV1NmxRK2JSRDlkVUZ0WjhK?=
 =?utf-8?B?aFE4aFlBTEZLNHI3bHVkMnJ3eWhnYmxDWlRlbG9BMWJQUE1YMGg1SWxqUlNz?=
 =?utf-8?B?UWZGQzU2WVo2eEFpRDZLTzJmK3QxU3Q2TFl4V2dTVjFWRGZ2d29GMi8zZ2ZH?=
 =?utf-8?B?UDgvR2FFU09DY1prMUw0L2RPTXhtdGJpVW1HQmlrTTNHZlZ0TjlKNDJSSWlz?=
 =?utf-8?B?TGczTlJyVEpxUEh4dTZRaitPamJ6TWIxQXBRdXNRV2dBTXZYd1M4SE85MlR5?=
 =?utf-8?Q?u18A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB6014.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ad7e484-956a-4866-9dff-08db640f62e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2023 08:49:04.9307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xEYtMLyCAg6E7MU/YN+sklAgLmNAHEctBx2NZrwi5mk9DJCYnQm03dy5uG9NRXvcR3ZzoCkAlVshrMye+Wsf1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7835
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
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

SGVsbG8gRWQsIA0KDQpXZSBoYXZlIGJlZW4gYW5hbHl6aW5nIHRpbWUgc3BlbnQgaW4gcm91dGUg
aGFuZGxlciBjb2RlIHRvIGdldCBzb21lIHRpbWUgbWVhc3VyZW1lbnRzIHdpdGggZGlmZmVyZW50
IGFwcHJvYWNoZXMuIA0KQXQgbGVhc3Qgd2Uga25vdyBmcm9tIG91ciB0ZXN0cyB0aGF0IG1ham9y
aXR5IG9mIHRoZSB0aW1lIGlzIHNwZW50IGluIHJvdXRlIGhhbmRsZXJzIGFuZCBub3QgaW4gSlNP
TiBzZXJpYWxpemF0aW9uIHdoaWNoIGhhcHBlbnMgb3V0c2lkZS4gDQoNClRvIHJlY2FwIG91ciB0
ZXN0LCB3ZSBoYXZlIHR3byBodHRwIGNsaWVudHMgZG9pbmcgdGhlcm1hbCBtZXRyaWMgYW5kIHN0
YXRzL2NvdW50ZXJzIG1ldHJpYyBVUkkgcG9sbGluZyBzaW11bHRhbmVvdXNseSBmcm9tIHRoZSBC
TUMuIA0KVGhlcm1hbCBtZXRyaWMgVVJJIGhhcyBhcm91bmQgMTAwIHNlbnNvcnMgYW5kIGhhcyB0
aWdodCBsYXRlbmN5IHBlcmYgcmVxdWlyZW1lbnQgb2YgNTAwbXMuIA0KU3RhdHMvY291bnRlciBt
ZXRyaWMgVVJJIGhhcyBhcm91bmQgMjUwMCBwcm9wZXJ0aWVzIHRvIGZldGNoIGZyb20gdGhlIGJh
Y2tlbmQgd2hpY2ggdXNlcyB0aGUgR2V0TWFuYWdlZE9iamVjdHMgQVBJLiANClRpbWUgYW5hbHlz
aXMgd2FzIGRvbmUgb24gdGhlIGxhdGVuY3kgbWVhc3VyZW1lbnQgb2Ygc3RhdHMvY291bnRlciBV
UkkgYXMgdGhpcyBpbXBhY3RzIHRoZSBsYXRlbmN5IG9mIHRoZXJtYWwgbWV0cmljIFVSSSB3aXRo
IHRoZSBjdXJyZW50IGJtY3dlYiBzaW5nbGUgdGhyZWFkZWQgbmF0dXJlLiANCg0KTWV0aG9kIDEg
LSBPYmplY3QgTWFuZ2VyIGNhbGwgdG8gdGhlIGJhY2tlbmQgc2VydmljZSwgYm1jd2ViIGhhbmRs
ZXIgY29kZSBwcm9jZXNzZXMgdGhlIHJlc3BvbnNlIGFuZCBwcmVwYXJlcyB0aGUgcmVxdWlyZWQg
SlNPTiBvYmplY3RzLiANCmEuIEJhY2tlbmQgZGJ1cyBjYWxsIHR1cm5hcm91bmQgdGltZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIDU4NCBtcyANCmIuIExv
Z2ljIGluIGJtY3dlYiByb3V0ZSBoYW5kbGVyIGNvZGUgdG8gcHJlcGFyZSByZXNwb25zZSAgICAg
IC0gMzY1IG1zIA0KYy4gVG90YWwgVVJJIGxhdGVuY3kgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSAx
MDE5IG1zDQoNCk1ldGhvZCAyIC0gQmFja2VuZCBwb3B1bGF0ZXMgYWxsIHRoZSBuZWVkZWQgcHJv
cGVydGllcyBpbiBhIHNpbmdsZSBhZ2dyZWdhdGUgcHJvcGVydHkuIA0KYS4gQmFja2VuZCBkYnVz
IGNhbGwgdHVybmFyb3VuZCB0aW1lICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC0gMTYxIG1zIA0KYi4gTG9naWMgaW4gYm1jd2ViIHJvdXRlIGhhbmRsZXIgY29k
ZSB0byBwcmVwYXJlIHJlc3BvbnNlICAgICAgLSA3MSAgIG1zIA0KYy4gVG90YWwgVVJJIGxhdGVu
Y3kgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgLSAyOTEgbXMNCg0KTWV0aG9kIDMgLSBCbWN3ZWIgcmVh
ZHMgYWxsIHRoZSBwcm9wZXJ0aWVzIGZyb20gYSBmaWxlIGZkLiBIZXJlIGdvYWwgaXMgdG8gZWxp
bWluYXRlIGxhdGVuY3kgYW5kIGxvYWQgY29taW5nIGJ5IHVzaW5nIGRidXMgYXMgYW4gSVBDIGZv
ciBsYXJnZSBwYXlsb2Fkcy4gDQphLiBmZCByZWFkIGNhbGwgaW4gYm1jd2ViICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
LSA2NCBtcyANCmIuIEpTT04gb2JqZWN0aW9uIHBvcHVsYXRpb24gZnJvbSB0aGUgcmVhZCBmaWxl
IGNvbnRlbnRzICAgICAgICAgICAgIC0gOTYgbXMgDQpjLiBUb3RhbCBVUkkgbGF0ZW5jeSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLSAyNTQgbXMgDQpUaGUgZmlsZSBjb250ZW50cyB3ZXJlIGluIEpT
T04gZm9ybWF0LiBJZiB3ZSBjYW4gcmVwbGFjZSB0aGlzIHdpdGggZWZmaWNpZW50IGRhdGEgc3Ry
dWN0dXJlIHdoaWNoIGNhbiBiZSB1c2VkIHdpdGggZmQgcGFzc2luZywgdGhlbiBJIHRoaW5rIHdl
IGNhbiBmdXJ0aGVyIG9wdGltaXplIHBvaW50IGIuIA0KT3B0aW1pemF0aW9uIGFyb3VuZCBDUFUg
Ym91bmQgbG9naWMgaW4gaGFuZGxlciBjb2RlIHdvdWxkIGNlcnRhaW5seSBoZWxwIHRoZSBsYXRl
bmN5IG9mIHRoZSBvdGhlciByZXF1ZXN0cyBwZW5kaW5nIGluIHRoZSBxdWV1ZS4gDQoNCkkgd2ls
bCB0cnkgdGhlIG11bHRpLXRocmVhZGVkIHNvbHV0aW9uIHB1dCBieSB5b3UgaW4gdGhlIGNvbWlu
ZyBkYXlzIGFuZCBzaGFyZSB0aGUgcmVzdWx0cy4gDQoNClRoYW5rcyANClJvaGl0IFBBSSANCg0K
DQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRWQgVGFub3VzIDxlZHRhbm91c0Bn
b29nbGUuY29tPiANClNlbnQ6IEZyaWRheSwgSnVuZSAyLCAyMDIzIDEyOjA0IEFNDQpUbzogUm9o
aXQgUGFpIDxyb3BhaUBudmlkaWEuY29tPg0KQ2M6IG9wZW5ibWNAbGlzdHMub3psYWJzLm9yZw0K
U3ViamVjdDogUmU6IFByaW9yaXRpemluZyBVUklzIHdpdGggdGlnaHQgcGVyZm9ybWFuY2UgcmVx
dWlyZW1lbnQgaW4gb3BlbkJtYyB3aXRoIGJtY3dlYg0KDQpFeHRlcm5hbCBlbWFpbDogVXNlIGNh
dXRpb24gb3BlbmluZyBsaW5rcyBvciBhdHRhY2htZW50cw0KDQoNCk9uIFdlZCwgTWF5IDI0LCAy
MDIzIGF0IDEwOjU24oCvQU0gRWQgVGFub3VzIDxlZHRhbm91c0Bnb29nbGUuY29tPiB3cm90ZToN
Cj4NCj4gT24gV2VkLCBNYXkgMjQsIDIwMjMgYXQgOToyNuKAr0FNIEVkIFRhbm91cyA8ZWR0YW5v
dXNAZ29vZ2xlLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGVyZSdzIGxpa2VseSBhIGZldyBvdGhl
ciBtaW5vciB0aGluZ3MgdGhhdCB3b3VsZCBuZWVkIGZpeGVkLCBidXQgDQo+ID4gdGhlIGFib3Zl
IGlzIHRoZSBnZW5lcmFsIGdpc3QuDQo+DQo+IEkgc3BlbnQgYW4gaG91ciBvciBzbyBhbmQgcHV0
IHRvZ2V0aGVyIGEgc2ltcGxlIFBPQyBvZiBtdWx0aXRocmVhZGluZyANCj4gYm1jd2ViLiAgSXQn
cyBub3QgdGhyZWFkc2FmZSBmb3IgYWxsIHRoZSBnbG9iYWwgc3RydWN0dXJlcyAoYWx0aG91Z2gg
SSANCj4gZGlkIG9uZSBhcyBhbiBleGFtcGxlKSwgYW5kIGhhcyBhIGxvdCBvZiBzYWZldHkgaXNz
dWVzIHdlJ2xsIG5lZWQgdG8gDQo+IHdvcmsgdGhyb3VnaCwgYnV0IHdpbGwgZ2l2ZSB1cyBhIGhp
bnQgYWJvdXQgd2hldGhlciBtdWx0aS10aHJlYWRpbmcgDQo+IGJtY3dlYiB3aWxsIHNvbHZlIHlv
dXIgcGVyZm9ybWFuY2UgcHJvYmxlbToNCj4gaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy5vcmcvYy9v
cGVuYm1jL2JtY3dlYi8rLzYzNzEwDQo+DQo+IFBUQUwNCg0KUm9oaXQsIFdlcmUgeW91IGFibGUg
dG8gdHJ5IHRoaXM/DQo=
