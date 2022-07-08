Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFE9577E5B
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 11:09:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lmbk954m3z2xmy
	for <lists+openbmc@lfdr.de>; Mon, 18 Jul 2022 19:09:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qti.qualcomm.com header.i=@qti.qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eu45Z8uH;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qti.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=mkurapat@qti.qualcomm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qti.qualcomm.com header.i=@qti.qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eu45Z8uH;
	dkim-atps=neutral
X-Greylist: delayed 1299 seconds by postgrey-1.36 at boromir; Sat, 09 Jul 2022 06:55:15 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lflsb1FgFz3c3Y
	for <openbmc@lists.ozlabs.org>; Sat,  9 Jul 2022 06:55:08 +1000 (AEST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 268IoaLr010699;
	Fri, 8 Jul 2022 20:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qti.qualcomm.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=777BkKhH4CWZOLPWq77C/flCZailsSjYJ941n4dVeMQ=;
 b=eu45Z8uHL/PCRHA6/8Cz/UCN4Mg+79nHWBpR1VZ06UgFAny+lYzyo/6EBMY3ggzfKKze
 Pdg5RGSaF75JDVv5Qvp3OueglDg2ePzCvBtjkUO89mAIM8UHn7KlMr2nq0YmCxp3+1a7
 DTk1eVM1+hzkvOLdVKmtsvJ919xkKwKsXBo78zBy86yoW9RnDHh5piggkyGvOEYdLFzK
 goiLRGu2gHsWmhj2i8EEmZ/UoMl1Ih5+tXhd97Dz485+b33JRTLw73tAGIEPNspyqzVP
 cuhMS3W80H4lJsf0JIAzKeMh7cR0LgbiuwLOpQqJtB5w1XMBZ0lGToytXbOU0ThnBfox Hw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3h5tjmuukb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Jul 2022 20:33:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UPcY7qDRFwUSWQzS1/w94r+U3as6FjA1gh9JwD4V5YnUaUXkKTKJ9zX5Syt3IHa4OsoyBrgtSPY2xJEbGD9QeeqDBsSi7uUFhnCPgAcuWN07hnr1X+Fzc0voMOCqRSye+4hXBlwh1jmDlP3czkkqsBTumj2UDrdRYBGgxoHPA/kustKARVmvKGa7Sp1FYMEhP+LDqpXPvzuUpQ0ymnIcDkgifpiWQPzcARkzXDYD0m99dOG/WEonbseBoUY1YOCkI8y/l0tvYiLhbWxjsI9YyHtQnCBGPBQBGNKMq3PwBTzHSoeMOQdrCRfrWoOhKgsUC/p+XXtbvf4+Lz/YKehSHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=777BkKhH4CWZOLPWq77C/flCZailsSjYJ941n4dVeMQ=;
 b=CiSK+73pKjM5Ot+1zThVH7egs0lAshXjMrYVUqk5CAEc5bOPcdlaUgYBLVdvCNKRG8yZdwCw5VHqNkSvFC9/kPzhmRPmQ42Bf5RBrzN33weKn3bwodk97NEm7WAeOJIGHggITtvVw4wqpVVxgOf8S7+unGdwO/I3sin/rw1dFrRqPXdfL0Ou8APBgaPU+PUVJBCA/Z2NSIx/42SkM3EcNXBj8AgZb4LRGCXMdlyx2SR1WvbkGI/C/XUNbeqnwvWn62klreYfwqTJQXeWz1fPkbuPSXbxE94vWOMMWpoVKCLBi/oxbtP3h9TiunzP98Mx2m9RjKPAvd66PfCROFBtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from MN2PR02MB7104.namprd02.prod.outlook.com (2603:10b6:208:1f5::21)
 by BY5PR02MB6593.namprd02.prod.outlook.com (2603:10b6:a03:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 20:33:28 +0000
Received: from MN2PR02MB7104.namprd02.prod.outlook.com
 ([fe80::81c8:b6d4:5180:d159]) by MN2PR02MB7104.namprd02.prod.outlook.com
 ([fe80::81c8:b6d4:5180:d159%2]) with mapi id 15.20.5417.020; Fri, 8 Jul 2022
 20:33:28 +0000
From: Maheswara Kurapati <mkurapat@qti.qualcomm.com>
To: Matt Spinler <mspinler@linux.ibm.com>,
        "Maheswara Kurapati (QUIC)"
	<quic_mkurapat@quicinc.com>,
        "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>
Subject: RE: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Topic: Add phosphor-fan configuration for the fan which added by
 dbus-sensor
Thread-Index: AdiQw7jTlyZgLp5ISCuvfelYhA3WzQCRXbGAAAApXtA=
Date: Fri, 8 Jul 2022 20:33:28 +0000
Message-ID:  <MN2PR02MB71048D351246B20FB088C6E8F7829@MN2PR02MB7104.namprd02.prod.outlook.com>
References:  <MN2PR02MB71041CCCF98E562120942620F7819@MN2PR02MB7104.namprd02.prod.outlook.com>
 <521635ac-e331-8afc-10e6-d20b7933c45d@linux.ibm.com>
In-Reply-To: <521635ac-e331-8afc-10e6-d20b7933c45d@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ded8e71-d76d-4c55-5ae2-08da61211d66
x-ms-traffictypediagnostic: BY5PR02MB6593:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  oFiEKQe36hAkJ8bWhSULhJuSmJzO+Ev+0vmTyfFUTB5rE6EzD7JwWMCkMbpB4JD9FRFHUSr+PFvMV4c/hW/1tz/co1JkU/PibU4CzVBlU2FTO6Hv7Nxmy3UUVhIJkcBvtyQrNniNG5IfATm7Aw/BqqMUrjhQ9uGbfmWiF3i46Iv0evNRv3iQUt9XewDs+FlVFeG1p2PKYdbBXNemAhJ0L0nB4MO3eWgB1WCnbu1e3UnuHNjFSv7HlZyU/mtJXem4gG74uOrvd/XOpf1tXCl2WRvWXTjzBPITbSOpYBeOgMWLty0XsisSckE172ddJBdAgjsCAXoTqwdpELa+q9AwS3nrB49ftzWeBeOqWNzfPmDs6g4vYOUXY5ECACRGHbtqXY4+h0UVBwu4Bz4orAmid7BHCS14bsgEoS/fY9cj8tkKQttHeFqF7C66OCKNIF1jgARwcy9RvILu9Z7exYMv/pDopWxqcNkj15sbbvs73CTXo17DrHbom4pGvGVdDqBxsEQyX6NtxM47DTmPH/6z/J+8OU0KI45H6I9ZYMQpbJgJQltf6adIHm1hyct6uiov2dy4HbkVPEryvyQfWgJykydOiyTqusxoxx/wQDSoBHDNjDYY2WsYlrmVjbQJJvfP+zth09mKCqxszx6b8wguh3TlXnmIMtkZymQcXvNGJmDt/EQCWuRAED2u676wfsRj6e3YNXaT6uKLFVDe5ifwwvBCTu6SMwSB+qXVtPAnXQQBc+cdKTUHIJHMwQPP/mmvdlQoM/DNRdHZe1aXMHD+9Evy0RXr1FIm8i9u8HhlfhOD+UCXiYzrlOvRuXIj2BrfPafiBeo3FxwT3NraFlFz1g==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR02MB7104.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(366004)(346002)(136003)(376002)(33656002)(2906002)(38100700002)(186003)(5660300002)(122000001)(52536014)(55016003)(8936002)(38070700005)(966005)(64756008)(8676002)(66446008)(66556008)(66946007)(83380400001)(76116006)(66476007)(110136005)(86362001)(53546011)(9686003)(478600001)(7696005)(316002)(26005)(41300700001)(6506007)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?WUdHbGg5dm9wczFhbVhwYnFvUHdFMHZDelFVYUJTbkNiSmFma1JlSEw0bVd0?=
 =?utf-8?B?SmRrSzJaS1RGUzA0MDB5aTUxL01hSnRtWUphRVMzN1hadHBWakxRWmNmSnNn?=
 =?utf-8?B?cjU0Rmpmc0pSbVpEK2J6V1RuOEIzTjBsc2FiWlp5VU1yejNvREMrWjdzdStI?=
 =?utf-8?B?VktuWnhZSHA0NUMycHZiQU55WWJrY2Uvc2RzNlMrOUl5VDVLZ09jc0dubG1K?=
 =?utf-8?B?cVNrSDQwUXlHWFE1OFdGdGRKVzBQUDJsU042YlNWWHdieDhHdUVlNHlrb0tL?=
 =?utf-8?B?a213VXJhZS83c3Fnd1JHVjFjeWlEekNuekI5TC94OGgvTnJwaFFtUTRlQi82?=
 =?utf-8?B?czJHM0tnQTBGWkRnTC9jUSs4VXd4WkduZWpRKzNsc1FMYlRHRnNFYms1NkxR?=
 =?utf-8?B?N1l4VlVDcnVJY1R2YkIwRVNmWnJheFdwNkVrRDNMWEoyZUlpdDFlWVpRTnpl?=
 =?utf-8?B?VXhtNUZiYldxS0NoWmNEOWtNd2E2Y3JwU2s5ZkdmUVNtTFc0Zmw0anlpbXEr?=
 =?utf-8?B?Zkk3WFZ5elVHc2w2WjFEclRqUmlVT2VxUkRuaERtMkdIby95bGF0bVg3Z0lP?=
 =?utf-8?B?T2dMTWRCRmY5Vmd0UkFsdE9YTDVlS1RUS3piSDVTaUxXWHJQTDRWRS92dlo2?=
 =?utf-8?B?NUpFZmU2RWF0aUZub1hpdGIwMC9BK0xJOXllSnpwRUNnMmlWOXBqckVLZmRr?=
 =?utf-8?B?eHVMSDV3ck5PdFg4aHBoWmcvamtSSXRKYzdiZmFtQTNqQ2liYk9OUUdyTEFD?=
 =?utf-8?B?QnlMUEd4eDRxb3c0K2FrbUtLbUEwc0MwWlBVVllpRnRud3RySmd4V2RIQzE2?=
 =?utf-8?B?VERLNzl6a0xsMEwzdXZlaUorbGJWNXlzK2l3a3FXcnVheGtDTGFHYll2aGVV?=
 =?utf-8?B?M2dId0YzWnlpVVlkVk0yYnp6cm5WMkhrNUZTZ2R2YmxBKzg2M0lkQlJWcnh0?=
 =?utf-8?B?V1ZQQ0VQUlJDRkR1SW9nd2FpMXl6aGRxZW5yL255UTdoSHhJdlRuN09RN2lG?=
 =?utf-8?B?czMrYjVNdW1VcWdSbkQyY0lvV2ZraTArSFVDQTVMUXh4dTlhbjV5OG0wOGtZ?=
 =?utf-8?B?QS9TbnNsWFV6YVQ1TlVubVMrdFV3ckFqVlNkQzJEb2xieldlemxXRHNRVnRC?=
 =?utf-8?B?ZWo4T0VGc01tNSt5WWQ3VFVtd01XcmpGZ2dKY05hOFcrVHBsSjA3NjA3N1NG?=
 =?utf-8?B?di9reS9Ic2VXS0xKWi9XVktvYU5qVVNPdVdQVmRRU2RyMVYxK3NiWjlJVVh5?=
 =?utf-8?B?c2pFdHh5TnhhTE1qL21wVHhsb1NrRWNTMy9iN1BoVDdJaEZZNG1zbHQvLzQw?=
 =?utf-8?B?V0RITjF3VGhKZVdqYXpRanB2OUgrOXlhRVRZaFVpMFprQkg1ZnB6N0pJSUpZ?=
 =?utf-8?B?c2EwSlVDbTV3QXp4YWRKeVRIVkp6TlZqNW95SmpCSTBKL0srWjBjemtBQThV?=
 =?utf-8?B?QmYxWGZYRnhGSlMvZjlHSnhjSGxaREZIZUsweWlBU083bzhXcFhsTG1kbUlj?=
 =?utf-8?B?a01jRGltVGs1MjdWazNBRmtZVGFPZDZNWXVjelQzdkNwMVJPNVpuTkJmSFBz?=
 =?utf-8?B?NjFpdFk1TEtTSVpuVFpKNXAyOCtvZSt0cFJSM3djOUwyT2lZVGlEbjlpTlJB?=
 =?utf-8?B?Z1hRM1pScUpieEdkY3hIeFJBdXFkMHRPaUpJZ2pmZzBpZ2dYbGNGU1hvTlky?=
 =?utf-8?B?TjNwT0xvcTBFV2wzOVVXOUJncHJ6MlRFV0NtNUppalcrQzVRWWhPaSt5RlVu?=
 =?utf-8?B?R0JvY3FIb2VWMXBycXNLVy9EbnRjYkM0bE5RN0trTG5HL3BIZmlVaDBaZC9t?=
 =?utf-8?B?TUJQWm15TU9ZYldvdjVPQXhVQnZOV2Zrc0lFNmdxVTVsbVZPNTdrRk1ycXVO?=
 =?utf-8?B?NzVodi9tVUkrMkJCYWsvbnczamR2YWhHM29jUENLMVFCTTQ3cVhVa0ExSFZv?=
 =?utf-8?B?cVlOczhGNmNZb2FnWXdMWSt4ZjVNVzFxZ3pEbEk0S0ZRbTJCaGJIRmkzUndD?=
 =?utf-8?B?MTduSGR3SlMrdnlJK2p5YjhQNDNlWk9CTEp1QXgxRmRBdHpXN0JJWFFyMjVw?=
 =?utf-8?B?dWhTMjh1bE1ialduMHZrWDZHdHY5N2kvR2NLeCtsbThYT2gzNTZpdFpncjJu?=
 =?utf-8?Q?YyA5a+sRGP/eTpg4j10euKbSJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR02MB7104.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ded8e71-d76d-4c55-5ae2-08da61211d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 20:33:28.1096
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dhgJKYD7j9HNmvfAeDkT2FYApW2kq85eVj91uMFcEhPDu/DL6F38Ncoyx8BVcasGtQKzbwLP3uMqeGfK4I0ZhuyhldH32GukA+DpdB2ypWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6593
X-Proofpoint-ORIG-GUID: OWlmXH01igbrgkxtaSxQImqo4AA_LjoD
X-Proofpoint-GUID: OWlmXH01igbrgkxtaSxQImqo4AA_LjoD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-08_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxscore=0
 clxscore=1011 mlxlogscore=999 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207080080
X-Mailman-Approved-At: Mon, 18 Jul 2022 18:59:37 +1000
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

VGhhbmsgeW91IE1hdHQuDQoNCk1haGVzaA0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0K
RnJvbTogTWF0dCBTcGlubGVyIDxtc3BpbmxlckBsaW51eC5pYm0uY29tPiANClNlbnQ6IEZyaWRh
eSwgSnVseSA4LCAyMDIyIDM6MjggUE0NClRvOiBNYWhlc3dhcmEgS3VyYXBhdGkgKFFVSUMpIDxx
dWljX21rdXJhcGF0QHF1aWNpbmMuY29tPjsgb3BlbmJtY0BsaXN0cy5vemxhYnMub3JnDQpTdWJq
ZWN0OiBSZTogQWRkIHBob3NwaG9yLWZhbiBjb25maWd1cmF0aW9uIGZvciB0aGUgZmFuIHdoaWNo
IGFkZGVkIGJ5IGRidXMtc2Vuc29yDQoNCldBUk5JTkc6IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBm
cm9tIG91dHNpZGUgb2YgUXVhbGNvbW0uIFBsZWFzZSBiZSB3YXJ5IG9mIGFueSBsaW5rcyBvciBh
dHRhY2htZW50cywgYW5kIGRvIG5vdCBlbmFibGUgbWFjcm9zLg0KDQpPbiA3LzUvMjAyMiA2OjE2
IFBNLCBNYWhlc3dhcmEgS3VyYXBhdGkgKFFVSUMpIHdyb3RlOg0KPiBIaSwgSSB3YW50IHRvIG1v
bml0b3IgYSBmYW4gYmFzZWQgb24gaXRzIHRhY2ggd2hpY2ggaXMgY29udHJvbGxlZCBieSANCj4g
dGhlIHB3bS4gQ2FtZSBhY3Jvc3MgdGhlIGJlbG93IGVhcmxpZXIgZGlzY3Vzc2lvbiBvbiB0aGlz
IHRvcGljIHdoaWNoIA0KPiBzdWdnZXN0ZWQgdG8gYWRkIHR3byBtb3JlIGNvbmZpZ3VyYXRpb24g
cGFyYW1ldGVycyDigJx0YXJnZXRfcGF0aOKAnSwgYW5kIA0KPiBhbiBvcHRpb25hbCDigJxzZW5z
b3JfcGF0aOKAnS4NCj4gWmpRY21RUllGcGZwdEJhbm5lclN0YXJ0DQo+IFRoaXMgTWVzc2FnZSBJ
cyBGcm9tIGFuIEV4dGVybmFsIFNlbmRlciBUaGlzIG1lc3NhZ2UgY2FtZSBmcm9tIG91dHNpZGUg
DQo+IHlvdXIgb3JnYW5pemF0aW9uLg0KPiBaalFjbVFSWUZwZnB0QmFubmVyRW5kDQo+DQo+IEhp
LA0KPg0KPiBJIHdhbnQgdG8gbW9uaXRvciBhIGZhbiBiYXNlZCBvbiBpdHMgdGFjaCB3aGljaCBp
cyBjb250cm9sbGVkIGJ5IHRoZSANCj4gcHdtLiAgQ2FtZSBhY3Jvc3MgdGhlIGJlbG93IGVhcmxp
ZXIgZGlzY3Vzc2lvbiBvbiB0aGlzIHRvcGljIHdoaWNoIA0KPiBzdWdnZXN0ZWQgdG8gYWRkIHR3
byBtb3JlIGNvbmZpZ3VyYXRpb24gcGFyYW1ldGVycyDigJx0YXJnZXRfcGF0aOKAnSwgYW5kIA0K
PiBhbiBvcHRpb25hbCDigJxzZW5zb3JfcGF0aOKAnS4gIEkgZGlkIG5vdCBmaW5kIHRoaXMgY29k
ZSBpbiB0aGUgbGF0ZXN0IA0KPiBwaG9zcGhvci1mYW4tcHJlc2VuY2UuICBOb3Qgc3VyZSBpZiBk
aWZmZXJlbnQgdGFnIG5hbWVzIGFyZSB1c2VkIGZvciANCj4gdGhpcyBwdXJwb3NlLiAgQ2FuIHNv
bWVvbmUgcGxlYXNlIGxldCBtZSBrbm93Pw0KPg0KPiBodHRwczovL2xpc3RzLm96bGFicy5vcmcv
cGlwZXJtYWlsL29wZW5ibWMvMjAyMS1NYXkvMDI2MjUzLmh0bWwNCj4NCg0KTm8sIEkgbmV2ZXIg
c2F3IGFueXRoaW5nIGNvbWUgdGhyb3VnaCByZWxhdGVkIHRvIHRoaXMuDQoNCj4gVGhhbmsgeW91
DQo+DQo+IE1haGVzaA0KPg0KDQo=
