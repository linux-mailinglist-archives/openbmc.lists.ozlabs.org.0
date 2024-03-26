Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D07788BF95
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 11:34:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=VwM5HJwo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3mPh74zpz3vlv
	for <lists+openbmc@lfdr.de>; Tue, 26 Mar 2024 21:34:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=VwM5HJwo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=52.100.166.218; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12hn2218.outbound.protection.outlook.com [52.100.166.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3mP705j5z3dH8
	for <openbmc@lists.ozlabs.org>; Tue, 26 Mar 2024 21:33:46 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giayIOI2WSzVWTU0fKbQ0ZVUydVT/JJdhCfBJV+PCqLcodVAX91ich72p3CtagxY/1BeHsZc4yR5pbK+M7sXtdKVsKuzD2WctRpBVGVJJ0rdrkP1blBQtovBoGbIGmw7aNMGtoLw1VJbdIzY3pcFOn3qAXVwp/qzao7g3QWB3Vusj/+ifB746pwsBxnl7fSJvEBQbdy1rLhQyBaivlF+dV3V+aHUjKtjMDZ5HYTP7ED84BTkxfA+tFrDe9IB7MqGcdykrzOSjYvoYfSvHN60PMVAAFmkf9QpU1Y5M5qu6fJmHoQA5V21ulI9gLCEnKTnfOSkDgstM6xM7cZjZ38bLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDbijP0qZV5vt8FYranFOw5fhBakuQtjYa6lbgJEk10=;
 b=DANhq2wSb13oILM4IQzKmXxtcyGpUHdYi38/nHMqYhXudC/yHMmVs3czOTBGC10Cjzkj+G4oBHW2sir1rbjYEAJ6tKFOmNec9p4H99Q6fncvfRBhmUyD6M4UKm79yZ+S7FwV+U8kg6ZP/BBzBf06hgcA2Q92zlVqhETuwEYML5kbmot4QYAdf4GB+SFtFlAbtJSNWdO9tS0ccrKFSrPaQ0tVe/Fw9+Od1oOOU3rfHuXYHZKA5Xqt7oV9tqjl+11KWGW9L0NNoE/iOayG59qrYn/6y8vpTL/U7IlHX+z4dsnXD3IIJtyxLcvfMG+UbzQV1+4OJ/ppllOYcpwUmU/aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDbijP0qZV5vt8FYranFOw5fhBakuQtjYa6lbgJEk10=;
 b=VwM5HJwoT+hAgOE4bRk8Zbuh3TyxcKkp2wlKwOp/LMYfQOYpK7Jk0sTVSBU9TLPSZALJzg9SISU/U3hyf+nGnBLVgUAIG2bDIJjRQ2SEiaOcoWmRH7S7IUqW5ph2LWKE7lHNw8IN8TZeyNlKA9RrOcDROIWKxnaWRLN+8dIvBK0=
Received: from DM6PR01MB5947.prod.exchangelabs.com (2603:10b6:5:1dd::12) by
 DS7PR01MB7880.prod.exchangelabs.com (2603:10b6:8:83::10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.33; Tue, 26 Mar 2024 10:33:27 +0000
Received: from DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08]) by DM6PR01MB5947.prod.exchangelabs.com
 ([fe80::b557:13cd:8a29:ae08%4]) with mapi id 15.20.7409.031; Tue, 26 Mar 2024
 10:33:27 +0000
Message-ID: <44d2e865-ee88-4054-a94e-06c6098bb0e1@amperemail.onmicrosoft.com>
Date: Tue, 26 Mar 2024 17:33:17 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: hwmon: max31790: Add
 pwmout-pin-as-tach-input property
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
To: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240311111347.23067-1-chanh@os.amperecomputing.com>
 <20240311111347.23067-4-chanh@os.amperecomputing.com>
 <20240311173438.GA1451467-robh@kernel.org>
 <ce8b2b49-b194-42f7-8f83-fcbf7b460970@amperemail.onmicrosoft.com>
Content-Language: en-US
In-Reply-To: <ce8b2b49-b194-42f7-8f83-fcbf7b460970@amperemail.onmicrosoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:610:54::28) To DM6PR01MB5947.prod.exchangelabs.com
 (2603:10b6:5:1dd::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR01MB5947:EE_|DS7PR01MB7880:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?K1Q2bmpMRDExT2JMNC9wR0ZXb1psY1ptR1B6OFJkSTdpV1UrN3hzT0w1ZFpv?=
 =?utf-8?B?WTVibUhLUzdTdzBQTWpwZmhsZFdZUWpxZ2dVM0RUSHFBR0hBM1B3SFQxbkI4?=
 =?utf-8?B?RVpMS2FZZ1ZLWUxuV3V3NldJLzBPVzdmTDh4UUIyRldKdExXaU5VcExkYWVI?=
 =?utf-8?B?bDkzTDI5blNBMzN6MXluV29rcnJCM2p0NVN4UUxxRTNvZlk4cC9abW4xbndP?=
 =?utf-8?B?VTNZQnpqSDEvdEx2S1Z2Rm9ENUdFTHpNL2YrcVZCaEwrVWU2RElJREZyTkpN?=
 =?utf-8?B?ZUt4eWRwV3hXTHV5YWEvamZ5ME50WjdPQUNqdmpUbXNYS2lYc0VFeHppQVJ2?=
 =?utf-8?B?aE0yalF3c1VBOHhKMktQb1ZQU2FPYVljS1BwRENDWVVnWS93NEVta0lRV2tC?=
 =?utf-8?B?b1psL1UyaXMxbkpxalhnZ0lRcFE0a3k4K1d1YnpmMlpQamNWcjVSY1VSNlNY?=
 =?utf-8?B?RlQwVXh3Y0ZrTkJ5SjNVaitXd3J4ZlJEVTE3eTVMKy9xaW9RNzBsVU8wYUUw?=
 =?utf-8?B?VUVaZUlSRGVrVTAySHRlUHRoNEVsbkJTOUlNS3F0RnkwbWtBUW10ZFVNMGxL?=
 =?utf-8?B?TjV5VEZBcDYrUzlTUDZ3ZXIrVVRGQWc4cHNVN3daNHk4SDhFRzRYKzI1STk1?=
 =?utf-8?B?WUw3TnA2L0lHTE40ZllZU21oblc4RVZkZjJXT1NsMnh3S3dtWDV1VE93VDhY?=
 =?utf-8?B?Y1piUndObjhCeWE0UkNSa0UrNXI0clJNSmhBdXMrRjNNeWg1ZGtER05LRFFR?=
 =?utf-8?B?bllvVUM2TUM3R2QwNE1KZHVNRzVVVHRPWVlNeFF1M0RrRjhoS1FpYzBEMnov?=
 =?utf-8?B?RVQvY3Y5ajNNV2FqV3JmRjRVV2ZOSzlpd25iOC9jZFNyRWlJNDFOWEpPM1pl?=
 =?utf-8?B?bmltYTFjUG9PS0tIYUU2Q0w3MWpsN1YxeGNlVWxka0VxdnhoOXREMFdlblNX?=
 =?utf-8?B?bFkyL2NSWlA3eURhVHlKMnROaVJQTWR5VE5iVDVJNXRWZ0tvcE54eVVBQ205?=
 =?utf-8?B?cXlaMjhDdjZrZjlEd2VBWUxGVjlabEwrMlNzOVorM2tXc0tFN2xOdFRMV1ZQ?=
 =?utf-8?B?UW5sUTNBdGlRNXQveVdkUmVJV1Q1d0NndHhhbUU1cnJuZ2tiSlhiVXZERTFz?=
 =?utf-8?B?ZDdaUEdna3JWclRyczFCelR3YmNIOGVyUytZZlBhd1VKSWo5Y3gwSll3OEZL?=
 =?utf-8?B?VDVNRjRZTWZUVkZodk1YT2NhWk9zV1pwRVpKNHE5NzEyVEtBbkhCM2dCSkZr?=
 =?utf-8?B?VUxjd1JYVy85MHhubEVDRUlTUDZFK0FsOE80WHA1NU1CMEg2YVJ1d0s1SURB?=
 =?utf-8?B?aWQwZWFMQ0g4NVNyVjN3blFqL3lYaXVzK3VMQzlFMlVidVhCamVud08vNHg0?=
 =?utf-8?B?cFRuQWtIdDJyeEJTRW02c1RvejFJZmVqcGsrZEF0WHJOUXY2K0dKRW4wbGlr?=
 =?utf-8?B?cm1hdm1EaGo2ejBwc0l5MWNLeVNSYUwrL0tadnFJZ01yTC9GVWY5S3hkYkI3?=
 =?utf-8?Q?wxPbdM=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:DM6PR01MB5947.prod.exchangelabs.com;PTR:;CAT:OSPM;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(34012699006);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZmlkcjRLVHM4VFlPNTVwRmhNbkYvZWxRNDNQTjl3T21udGM5aHdyWjVtdndR?=
 =?utf-8?B?VGhNcHo4M21zSkR4UTJZTG01QVhScHgwOEFVRUNXUTJLbDZ5OEJick9lRDhp?=
 =?utf-8?B?c0FPbUtrY3hSdmYybWtGaEZ2WTlHSk9EYlViN1FmaWFkVy9aTEFWQ2ZzTUkw?=
 =?utf-8?B?WnFaWDZkcG9LaVRYRmcraE82Y1RKRmVDek5HVG4xRTZaaVc3SHlLaHU3ZEJB?=
 =?utf-8?B?YmJoVHdxVko2elFKQURBOVVjaUU5VXJMY1NLWUxYL2N4bTE0SmlHbEVIK1Rk?=
 =?utf-8?B?UXpkK2ZSNE0wdjk0cUtOM3B2VGFsM0J3QUlnVGl1SVhOVk9sNnlmdU5KZ0pJ?=
 =?utf-8?B?dTQ5VnIrM3dUZWRsQWJKTjEzdXRNOXpvT2puWVdlV1RUYlpIc0ZhaXJabi9Q?=
 =?utf-8?B?OTB6bWdiT0wyTnpPTlg4VUdxb0tncFJ0NGJpSkRXb01CRWREd1VkVDZZTnZ4?=
 =?utf-8?B?OGNEN3ZUMmxTaWswUWViOUlKMGlpMFEvV0tsRGY3MWdVbzNrNVV4dUJJWDJz?=
 =?utf-8?B?d2pzK1p3VU11UVBYdXpCeGVWdWtPc0ljNnFwV2dHRE9lZGJ0alZLTzhHYmMz?=
 =?utf-8?B?aWRZN1JMZGVldFhYUWR3SXNLZ3lRMmY4WHNzcmUzeEJnRWx4c3QyS2VscmF4?=
 =?utf-8?B?QWlJcFJKN3llZHdDTTRydlBmdi9LMGNKYUIwOXA1dzZ0YU9LSmw5aGoreTNu?=
 =?utf-8?B?Y3RaYkI4MGJoTHI1YmNYTDk0Myt5TFlTKy9HT1ljNEUxTG8rS1V3SHp1U2Vz?=
 =?utf-8?B?SkpUc1I4N0U1a2F1eDhaZEREV1hpYitjRU1UVGgvRDJwQW9hU1pYTGg2ckxh?=
 =?utf-8?B?N0NIMDVkVHBzY0NVbGVoUUlqNXE4OE1nU0lCWjBCQWdTNllLVEtJVlY3ODR5?=
 =?utf-8?B?Q1ZLeGFwb29oRjhFZ2E5NWV5b2poYTNsbHlldkZhemJvY0hjVjF4anRxQ1dh?=
 =?utf-8?B?Vmd0UzROQmc3VWpVOG5aQ3h0NzhGWEJwWEhHcjEycXlVMVMxTkdmSVppcTJp?=
 =?utf-8?B?SGQrT0UvbmZoN0k5d0JaSUdjcXhPUG9iN2hleFBza0dTSDdTclhhMTVLZjBq?=
 =?utf-8?B?Vnl4elNVZ0lEZCtGTkdkdGswZys5cVJpMlZFOTlnK3FuOFZjOHJQbnF3ODVo?=
 =?utf-8?B?QlVUS0ZoL2c4dUhOVnhFSW44Z3dWRkhjY2F0Z0NrNEZyYkVqL3dPUHpzNTh3?=
 =?utf-8?B?S1Yra2R0WXR1MmlqdjZsUlNnWGZ5MzJDc0hjdU5nSU9sRkVtbDhyakV6emFW?=
 =?utf-8?B?TlFPNkpqYUs5VUwyYndjNktyL3hzbFhrWEZqNWRtQmJvQXlmT3JTOTdCZTI0?=
 =?utf-8?B?Mk8wL2RBbjg2N3BocWVQZk1BNmNvZzBqM29PbnRtRm1GVjZNNGNjWUNSTGJ4?=
 =?utf-8?B?T2VXQkV4WWlTalAwRm16YkRnTE5oS3g2RnRhc1NHaTFBODA1Y2FHeGNKeGtk?=
 =?utf-8?B?MHdpQklST2loOEwyUlNyTnBSaTdTaHlnakFZTzErdjRXUFIyb3BoTHV4OXNV?=
 =?utf-8?B?OXVaMjNxSC96TWkrUU5xaDJ6dEp2bUdNK2l2bys2bEJJUWt3d2doV3JLa1Mv?=
 =?utf-8?B?ZkdDbDRxRWNRWkJubkZGWk9sTnM3U0dpblNzTVc3by83eDNsQXJnS2IydGs1?=
 =?utf-8?B?MEkwOTBmcmlPc1JqeGpkM1FlT2MyZG9kVTN3UW44L1J1Y0ZrWFBxOENNQVYx?=
 =?utf-8?B?ZHpLNWkxNXBteVRLZ0ZKTXpaRkpVZzQ1dkVWN2VjOUsza3k0Rk1CMEhrQ2FU?=
 =?utf-8?B?aFZGKzVBRkVVbk5GcDdPTVdzTkZHZi93bjFZbCtMUkF4WTZxUGtjc0ZRbnps?=
 =?utf-8?B?V3FoRk9mQ2tFQ0tmbFVjOVBFQnZlK242QkNhaFZxZWJhYmw4WStjMENNL2tL?=
 =?utf-8?B?ZlorV0dINmpVZURheHQ2dmQydFhUZ2lzQ0s3azVKRm03QnVTWHJndjdnbDRP?=
 =?utf-8?B?S1VwenlhWnpCOUY1eVpSTUdFMVVqTmdoR1YrbVkzTlROQTliNnk4ZWd3bitt?=
 =?utf-8?B?bCs5ODdQQWxPemdUdGpDVmowd2tueG1INnptYVlDMG1qNjE5U3NrZmx4T0Fu?=
 =?utf-8?B?OVZkTiszSnRzRkQwRXhZMDVBRU1NUUQ0Njcwa0Z5T3FRaE5OWDdyOURJY2tB?=
 =?utf-8?B?WEYrSnUvdXJzMjlTUEprTFBVdkkvZVd6bDFVeGl6TGdrTkpjWk1JbjZ0QmtI?=
 =?utf-8?Q?591KmzXJXKQIC5hEsvoy4ek=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c802408-97b6-42e1-4943-08dc4d802c1b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5947.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2024 10:33:27.2490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVqnd+/G9XeypkAwpsZMDrqYiP1Pgv9MWXVbQqYFHbpAZ2NFLJV9lraokHvCjXgMPC8Yetv7gEIiN3BTHhgAUiIMrkhrVlP+KgxCO0I97vzSmUPB/KUkzfeybAkxmfcO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR01MB7880
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Justin Ledford <justinledford@google.com>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 18/03/2024 16:53, Chanh Nguyen wrote:
> 
> 
> On 12/03/2024 00:34, Rob Herring wrote:
>> On Mon, Mar 11, 2024 at 06:13:47PM +0700, Chanh Nguyen wrote:
>>> Add pwmout-pin-as-tach-input property.
>>>
>>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>>> ---
>>>   Documentation/devicetree/bindings/hwmon/max31790.yaml | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/max31790.yaml 
>>> b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> index 5a93e6bdebda..447cac17053a 100644
>>> --- a/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> +++ b/Documentation/devicetree/bindings/hwmon/max31790.yaml
>>> @@ -25,6 +25,16 @@ properties:
>>>     reg:
>>>       maxItems: 1
>>> +  pwmout-pin-as-tach-input:
>>> +    description: |
>>> +      An array of six integers responds to six PWM channels for
>>> +      configuring the pwm to tach mode.
>>> +      When set to 0, the associated PWMOUT produces a PWM waveform for
>>> +      control of fan speed. When set to 1, PWMOUT becomes a TACH input
>>> +    $ref: /schemas/types.yaml#/definitions/uint8-array
>>> +    maxItems: 6
>>> +    minItems: 6
>>
>> Seems incomplete. For example, fan tachs have different number of
>> pulses per revolution, don't you need to know that too?
>>
>> There's a common fan binding now (or pending). You should use that and
>> this property won't be needed.
>>
>> Rob
> 
> Thank Rob,
> 
> I checked in the 
> Documentation/devicetree/bindings/hwmon/fan-common.yaml. I found the 
> tach-ch property, but it seems define the tach channel used for fan.
> 
>    tach-ch:
>      description:
>        The tach channel used for the fan.
>      $ref: /schemas/types.yaml#/definitions/uint8-array
> 
> I would like to define a new vendor property to configure the PWM-OUT 
> pin to become a TACH-IN pin. So I introduce the 
> "maxim,pwmout-pin-as-tach-input" property. Please help me share your 
> comments!

Hi Guenter and Rob,

I'm preparing for patch v2. I'm looking forward to hear your advice. 
Should I use the "tach-ch" property (a common fan property) or define 
new vendor property ("maxim,pwmout-pin-as-tach-input") for my purpose?

Thank you very much!
Chanh
