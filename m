Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 923126D55B6
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 03:07:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pr8kV71Xzz3cK8
	for <lists+openbmc@lfdr.de>; Tue,  4 Apr 2023 11:07:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bwCGgaFn;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=lakshmiy@us.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bwCGgaFn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PpBJP324wz3fQW
	for <openbmc@lists.ozlabs.org>; Sat,  1 Apr 2023 07:11:32 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32VK9eVX012225
	for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2023 20:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 date : message-id : content-type : content-id : content-transfer-encoding
 : mime-version; s=pp1; bh=OWn4UJwtepiQq90Hq3IbkSKm3Nf213lzqRZhdgZhzgQ=;
 b=bwCGgaFnOWSdVTUwOb6FO+jcV20zbliwE/8EzPYJ5FgfIr6iBNAipArOIZpY8Heiiasc
 0V8GktjIGynZap7afLCMnH7SrfiBgOn23GCRRriwKgJKF85TFstV4HEIRzSK7vnTuth0
 Z7/aUGEMtvOqCtDS3NVYePrePNpz80MTnP7k8tWV00kkdQ33oWkuk12JssTbmDIAhrmM
 OROB5eJYRtgSFTNYreXhlNhmRyb2DtWGPWVXWRUNQcbhD3Qi9/obgs2/bvQnEc+lK00U
 gCDRxUa9iMbNjqbs5jCiVw8q7seGbU4I6YHu/dbkqRpcj0DgQGIrn89blb0QusDouNIO Tg== 
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2046.outbound.protection.outlook.com [104.47.57.46])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3pnu3pbjpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openbmc@lists.ozlabs.org>; Fri, 31 Mar 2023 20:11:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeB5V3L/DCHT7cwCEJM1HwB8zGGlifaxdGJvRgb/jxTstiOp8breKqMpCtmu0Fpj1axLqFqI9d5MpRp3YqU3P1yLSWpR+ATdTV9PGv8hVLzQYbkM0QMtwWxgTmibclAwD3re7JwmC2jQ2DqOHV6cU3NIKhJis2K2TRWmeiZzz0jq/zdPCMTyin0QLzfhZoD/CPkzg4BMxFziwUpBTxo6CFL20V3Feq4UMFKEHf2fXikTen1FuBjeUqHa0VZ6xCvJ9RfrJVs0b4wMPQcC0uUIrJs/ykZlc1RFbFM0JuW8Wn45qDME0CU7bF3nuvm8Yu0K2N7gTlpyBpsumAMPySgYLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWn4UJwtepiQq90Hq3IbkSKm3Nf213lzqRZhdgZhzgQ=;
 b=GbTAQckiLuyCXIhUNIsKSBMADZ2LCn55eGwL/jvmvd7w/p1CvQ++pBRan3xfx7CjvjqeHG9aB7FlVlT/co6HQPKSxg61PhDHa3biQqPtzIbA9XJ5c4nGu4B70CKz/GRGdAp3H22nDzth4Sulazpbgq0yBzfN6jZyj310X6M8jBFTBE8Vkt5pxgNvE585b+DrdJkUavZnn9r+P5fELwmt/gkgMG0h8NHGEURFlK6bxYe+bI0hii7kGMakrgWEjgEfK5AZZf9nlPRBri5fEzPljgPklXYTN87W1wqf4/4j/urwD1a9MRg31T+u9jWmf4wKMhV2HB7nM0u4h3hJ2ue4jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from MW3PR15MB3898.namprd15.prod.outlook.com (2603:10b6:303:43::24)
 by SA0PR15MB4000.namprd15.prod.outlook.com (2603:10b6:806:8b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.22; Fri, 31 Mar
 2023 20:11:26 +0000
Received: from MW3PR15MB3898.namprd15.prod.outlook.com
 ([fe80::e734:439b:b3e:c4f3]) by MW3PR15MB3898.namprd15.prod.outlook.com
 ([fe80::e734:439b:b3e:c4f3%6]) with mapi id 15.20.6254.024; Fri, 31 Mar 2023
 20:11:26 +0000
From: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Moving to correct PCIe Device Interface
Thread-Topic: Moving to correct PCIe Device Interface
Thread-Index: AQHZZAz4wsf/Z8qFtEGkS1yPFSdGJQ==
Date: Fri, 31 Mar 2023 20:11:26 +0000
Message-ID: <9FE52383-B329-4100-906B-86F794EEF3C0@us.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR15MB3898:EE_|SA0PR15MB4000:EE_
x-ms-office365-filtering-correlation-id: 77f15550-33cb-4145-c1f6-08db32241b7c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  wav/AVxNbC9Hzl4qMVNHVKcMencBt97+FjUsnM78on9t7lrHmvoRQW3q6Fi8b3AZogR2aX749iXutVJIEnZxm9DrlczluQ1h+3S72YykKwGkkqUH7PGkAcQMbbVjqO+POpHK3TsYLOLtM206tvwfOkBzNHsbSwh5zB7o7YAljW2jnPx282n7d+qNT4sYFseXSIhabpQSlwZVmmk9xNgRQA6oGNCwEDhg6JttyFb7P3zPAOAa+rB7uK5wX1V1S1QvzwqhBp3A080yWfiLu2ITzVIN47ZrQUO5dUaIlYgwX1v13esSYKG9XM6js9jyOJKE6MwnjFZkrmyW3aVetQGssiQ4Gu88Qt9n1zNOe01UqfDHLbD3TdHPlQx7mU5C9vJgcHacMHgQWrCIlC8zI/rTzktm2/4R14p6skXbkBYEplyl4dkZrinoOVAdUb+L2JQFo051plIgey0CFdiV/1+sCpLnmm5tyw5SOhv8/WFWj9RH+w/e1scVc7oD2B6C2KVgHSUmyL/im6WZCFGwOepGF5MoDC/905iE/Pl+0bMbwCUcx+omvdMRTHIQ9wrY7+98qKjlZ8UJwQIzjtFlrbVR69hCi0zE7IXoICZ/Tw6YGtEEuE4PxeaRas+J4hUgrhIJlZ/boif/dsyuyTVDBbsX+KYxrMMNDfoI7dW2hGx3V9wbCrbHMO0TBEiYg1XQeerU
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR15MB3898.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(136003)(346002)(376002)(39860400002)(451199021)(6916009)(41300700001)(66556008)(558084003)(66446008)(64756008)(66946007)(66476007)(8676002)(76116006)(91956017)(2906002)(86362001)(38070700005)(122000001)(33656002)(2616005)(38100700002)(8936002)(5660300002)(6506007)(6512007)(71200400001)(966005)(6486002)(186003)(478600001)(316002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bmE2azZFZi9kZEJjUm9qU294dmEvY1oxb3Jqd0ZTWmJnZTNoeTZHWm9xL3dS?=
 =?utf-8?B?OXVRRG5McjFjbkFEWm5PUjVIWWR2ZGNnbU5xdnNNNjlURGovd3BseVpKNzAy?=
 =?utf-8?B?ZlJQbUlLb1pwcnFKYi9iSVQ3MVlkRVZHSUw0LzB6OC9vRU45K0pqWTNpUmZ2?=
 =?utf-8?B?UGU4VUd6d1ZZL09oQ0hsM0M1ZDdaYjJINEt2b3JYOExQdmVuanp1YndmTk9y?=
 =?utf-8?B?blU4NmQyam5iTmNJc0ErRXNkTkp1bjlTQUVuTmMzNXIxa0dXRmVOWWljbUU2?=
 =?utf-8?B?d2lQT3p3aW9qV1VGMFRmMDYraXNtNDhrazl5Nkl1RkloL1UxcndKWVd0NC82?=
 =?utf-8?B?OWhxcWhVTnVPSDBqVkRDUlBQOEQ4ek9Jc2l5cUVETWY0eEltcjZGR1ZUbVNi?=
 =?utf-8?B?V2E2aS9UTTlJYU8rYjJIWU55Wnd2RFdFUzZUQy9nUlhKL3dlaExTZ09YaExE?=
 =?utf-8?B?aWZyc0RqQkVkWGlaRCtRcmVheEQyYzlpbFFwSldIbHpqL2VlRGRQQzNlazU5?=
 =?utf-8?B?dkpTcDZsWXB3SUpUWGYyNmIrRmVIQ0ZlQUdZQTl0V1RqWElUUDhzRCsrVGx0?=
 =?utf-8?B?UEZHa255YmFneGtMdUJEVHVXNnkyRFQrSTE0ZFBOWHptVE16amFWWndya1RH?=
 =?utf-8?B?dHVES2pGWnBPcm5VTitjVndlcmM3NUJYS1dyNnVQQzVzWXZTZTRCZFdYVTB1?=
 =?utf-8?B?VWpTL1dydTF4QjFyU2wyRk9MK242U2NFZHViMEZsbVVUdEtCOGc5d09rOFpr?=
 =?utf-8?B?TGhZRWZBVFhudmYwWWxGYjNuOEppcW5pV0lQbXA3WXVsR1VTd0tJOHltdzkv?=
 =?utf-8?B?S2JqaGlxRFhWbElCUENydzMxTFZUOVlmajFVcE96c2hwYjdjRHFKVzc1U0Qz?=
 =?utf-8?B?a24vdFNOUnl0eDcwcTNwVzZMUk92N2ttcVZURDFoSUlmMWdvamxVZkZJN2ZR?=
 =?utf-8?B?SC81Y3ZkSnY0bWh2VmFIOFZXK2Vldkt3cG9hK0xpNlJWUjhKWUNkUUUvVGFw?=
 =?utf-8?B?b1NqRU8yOTF1ZjZQTitTL2dJY3hxSUU5QjZ3WldjZWRGdWFUMW4zbmNhdHRO?=
 =?utf-8?B?S0cvcDd4U09tUHBzd2hDeUpsZDRuUFIxYjBDTWhERkJqTUZYS2IyZ2dBRWJp?=
 =?utf-8?B?UHNMaDkvR2t2MWlhNGNnR3JZNGFIRmNnMkdvanpQV1htcE45cEpMSkZmM2g2?=
 =?utf-8?B?M2E5TkIzaVV6ZG1tM1JiVXB0dFRhVStKRU8wbWNjenU3bXVCZjVhbVJIRnov?=
 =?utf-8?B?SFVMc0t4eXJSRlNBRVZaUjRYbDVwQlB3NmJyYzFEd2VzV21QZ0l2ZUxrWnFm?=
 =?utf-8?B?dzJqS2loODRRRXFyTlIyamRud2sxbjZRcW1xYTk1QWNYc1hrRmtxa1d1cWZS?=
 =?utf-8?B?TStDZzczQSsxNXIxRWxseG5VYVpFd2JkY3FFRy9TMTVrV1dzL0JzVW1WOTZZ?=
 =?utf-8?B?UDNPdlRiZ3VWNmlWZ3dLWGxjRlhBLzBoVWlPcGcvWlRyYUYyTGp2OEJRSi9q?=
 =?utf-8?B?RHBwamtPSVAzczFIaXNjWmJBdlpXdDIwUkdJYmRHRmpJbU5QOFpCd2h5bFZZ?=
 =?utf-8?B?QlpEYlh0UDJKZlFYMzhGczd4NlR6TDQ0dTBkVDl1RUo5RjhDMVc0RWRDL3Ri?=
 =?utf-8?B?cXU2TDdWLzUwZUJoVEdCelRpMWxjdElNaXJ6Uzk1NCtBS2dvWjhQSXVoWk1v?=
 =?utf-8?B?RlM4MFFTT2g0MHhITDVhT2FtU1JZSXllblNZakNjaTk5Njd1NVhEZGtRSE8z?=
 =?utf-8?B?MUFLVGVGSlBJeWJqaWZFUHdnL1RSeGhzWWp6c29HSnZVTkJaMlptR3d4a2FJ?=
 =?utf-8?B?VzRBMjczWUttM1JyaFNOQVMzYkVzanQxL2VVWUw0VEx2dEhPalN5cENvZVdk?=
 =?utf-8?B?T2ZqaE54L3ZGbURxeGJFT3I2V2VsbFRoRUxEUGdheWxBR0tmeFlUR3dLdzZC?=
 =?utf-8?B?bEFsaVdvd1UxWi9nSklrTTVYY1J5b0VBV1kzVzNkZkNzOFBlRG5aNzR4N0Fw?=
 =?utf-8?B?NnhCQnZNQzJkaWg0d2M3WGJoR2JSbHRiQ3RZdHFldGVYSGEyOGgzWFpzQkxY?=
 =?utf-8?B?VVZtWGtvenA0dGNIRm5PRGZQYXRWYVZ5S083OGsvQWtZMnYvSzZwdFVmWkt1?=
 =?utf-8?B?L2NaVCszL24xSW0rMzhhRThOeWppejlpdFA3Zjc4cHVwNWF1VU0wUzBxSGVI?=
 =?utf-8?Q?dA1Wg5ORgY20PQ9mrIO6VHQB3BYvJO2fbMNpZZc00d2D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A0E0D78B0B060B45BB974092B945BC40@namprd15.prod.outlook.com>
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR15MB3898.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f15550-33cb-4145-c1f6-08db32241b7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2023 20:11:26.4107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ftiXKzRu53SK+y96ZJCl0h/g38pc00WM597IuGNXtHA12mC6k3YIL3vTpAZWQfddCvxQToN28HhmPfjeOgS1+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR15MB4000
X-Proofpoint-ORIG-GUID: T7-BmhO0PCDzU8LPMMhMtWBeXJ9srxP4
X-Proofpoint-GUID: T7-BmhO0PCDzU8LPMMhMtWBeXJ9srxP4
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-31_07,2023-03-31_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=429
 impostorscore=0 phishscore=0 suspectscore=0 clxscore=1011 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303310161
X-Mailman-Approved-At: Tue, 04 Apr 2023 11:07:03 +1000
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

Q29tbWl0czoNCg0KaHR0cHM6Ly9nZXJyaXQub3BlbmJtYy5vcmcvYy9vcGVuYm1jL2JtY3dlYi8r
LzYyMDY0DQpodHRwczovL2dlcnJpdC5vcGVuYm1jLm9yZy9jL29wZW5ibWMvcGVjaS1wY2llLysv
NjIxMDANCg0KYXJlIG1vdmluZyB0byB0aGUgY29ycmVjdCBQQ0llRGV2aWNlIGludGVyZmFjZS4g
QW55IGZvcmtzIG9yIGRvd25zdHJlYW0gY29kZSB3aWxsIGFsc28gaGF2ZSB0byBiZSBtb3ZlZC4N
Cg0KVGhhbmtzLA0KTGFrc2htaSBZYWRsYXBhdGkNCg0K
