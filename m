Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB536DB64B
	for <lists+openbmc@lfdr.de>; Sat,  8 Apr 2023 00:07:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PtXYJ6kyRz3cG1
	for <lists+openbmc@lfdr.de>; Sat,  8 Apr 2023 08:07:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=j+hOkh0T;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=equinix.com (client-ip=148.163.159.192; helo=mx0b-00268f01.pphosted.com; envelope-from=prvs=94613c61ee=zweiss@equinix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=equinix.com header.i=@equinix.com header.a=rsa-sha256 header.s=pps202002 header.b=j+hOkh0T;
	dkim-atps=neutral
Received: from mx0b-00268f01.pphosted.com (mx0b-00268f01.pphosted.com [148.163.159.192])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PtXXj3tqkz3c9K
	for <openbmc@lists.ozlabs.org>; Sat,  8 Apr 2023 08:07:16 +1000 (AEST)
Received: from pps.filterd (m0105197.ppops.net [127.0.0.1])
	by mx0a-00268f01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 337ImXP9018513;
	Fri, 7 Apr 2023 22:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=equinix.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pps202002;
 bh=Y69ves20w1uIbm5VyaR6F2HGK2e2KnT6Wy1fkYtMsqg=;
 b=j+hOkh0TQy1YP/rtY3nbJD3W8G68mS1j2hjmSkfmdbF3ySHczmYEBlpYo+R27A6J7Kho
 /XQE0sIKtxeRgws4sd39QLxOU/ao2VECcJE+xkgiPaGLEWQ0OtgkFLbjB3MDnbBfV6SL
 +bx+fjVMdvnK+/okeOb9euvUECc/PDUUuhRHIOczuT0BNRbY+2A7qpsqxuII9R96mJbP
 4zpChM6kfTjCLlmhQKcsNW9Gh/hMx5ohMmG7thBh7VSy4Go/aH8y0FpLGe5jceL68SEI
 xC1GAybdL67jTaORQFsAPv5ICSKkWDS9XYiKzMIz8t5h3kRSaEUbnJ+Z0HJpFJ+G7uiq 7w== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-00268f01.pphosted.com (PPS) with ESMTPS id 3ptrs9rddy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Apr 2023 22:07:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQAcUFccF5Yzll3ebn1JUIPnU+g5SdBFt7yGScTfs8XQSMzsjXM59RmNAJTa0424RLIPaatP+6nQD4wASI5qIgo4BztYdJQvQiSatHezNo3O7/gV/eo4am5iypEe18cyobfrgOOuIG6u0/Ju2rFxVo/4w34sk66EtLIR+4ta8oSEJiGv9Dw7TgKewLK4iWuNLJyQsnm2OK+mEFyfHC4nUGvVORE1K06d0B7KA46ignAYvM3oYVQwq8bJKTQhIn/4rhbWd26pmpkEpw4Bv2dTDsSyC+D3jGx6B6D8z1Su3KW8TPDeU0EsLqnqNSGlG26+/CSJNgasm/5IurJNmmQ2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y69ves20w1uIbm5VyaR6F2HGK2e2KnT6Wy1fkYtMsqg=;
 b=ThzaIY4ViE2F5CCnmurOuQO/7/Mc07mvx6ImGFaF1KruO70XnjBu6iXubR3zPPaLj7wjO6Io4TI4iqdeUWFaXwGOZivpTyHd/ih3DpUnW2k/fL5uPUImOwlqzTaTpZmNhP+U3lF+JdGcNNkRD4OzDDkUMx4xgHEb9pNe7aJsHuLLkbeye2/jwFzRuAjVZslW9TrhaND083wGSB6eBXntkZ8paSeJFtVctasmatRr7iPWcYtKpFSRQuu82XjMvzav34UGSmNWO4wXTnSyMmfIWSz9QeD8xalER8Nt/3nHSiB7YlXbk4Jqhv8LjFLTD0FA7ZNKdmzyIt+2AevhiUmVZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=equinix.com; dmarc=pass action=none header.from=equinix.com;
 dkim=pass header.d=equinix.com; arc=none
Received: from DM8PR04MB8007.namprd04.prod.outlook.com (2603:10b6:5:314::20)
 by DM6PR04MB6971.namprd04.prod.outlook.com (2603:10b6:5:24f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.33; Fri, 7 Apr
 2023 22:07:03 +0000
Received: from DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::aee5:f366:66f7:2e04]) by DM8PR04MB8007.namprd04.prod.outlook.com
 ([fe80::aee5:f366:66f7:2e04%9]) with mapi id 15.20.6254.033; Fri, 7 Apr 2023
 22:07:03 +0000
From: Zev Weiss <zweiss@equinix.com>
To: William Kennington <wak@google.com>
Subject: Re: OpenBMC kernel and CONFIG_PREEMPT
Thread-Topic: OpenBMC kernel and CONFIG_PREEMPT
Thread-Index: AQHZaZ1IrJc4YtvIikSKuFI6jJiAdA==
Date: Fri, 7 Apr 2023 22:07:03 +0000
Message-ID: <20230407220702.GE18848@packtop>
References: <ZDBqT-V-nM0ipaMq@heinlein.vulture-banana.ts.net>
 <CAPnigKnU_xma-GOyB0SGpaEOeVX-YhVMun+QpQyWL6dCrZwMZw@mail.gmail.com>
 <CAPnigK=e0b7pFX5jYujSay-D9N-tsr0ttRhCuxBv67Z77r7kaw@mail.gmail.com>
In-Reply-To:  <CAPnigK=e0b7pFX5jYujSay-D9N-tsr0ttRhCuxBv67Z77r7kaw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR04MB8007:EE_|DM6PR04MB6971:EE_
x-ms-office365-filtering-correlation-id: 1ebae1dc-f56f-4741-f401-08db37b46aed
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  p+RdqXjvaoJPFR5Bq88vauUK0YPtmhhGXHuoTsc+RzcSxTK6Cydt62DWSL+fbFWgoMvHzhYN02ZOqlxzAijguC8OGli+/3U+hEIe0ih+mIpHm5sPtUi8V9nDAeMMm2PsP7VqInnCxOZwk1xSLvMQKZDFFbaYrbDpz9/4eaef2QINJgAyMZ4odTq+zQ/Obe1aNcCN/bgZ2lg7qxyRLFB2INbWZkx81q5vIM0fRPh8Kh6ygtWQ6QjUg+HdMoF2vFScUHBTJeL8Jh+4R/8iWp8csJ0ZzCwu+rESgjeOSc4XKicqtcc4bfKxaJV1DwvLE+8HqX1YBLUXwHndQ9ZqmgQcMOnJbYI9DVMmuwq+uk3vy8pjTZcd3irfUf/kZLP6l4PfynRcwcSf1o311UwSUXFnsC8Hs15M6BBG+wDGMHhkndTn3nez3thoYp8zaKmCIS3J+BOv6j/8n46cXW/HfQYVfbc7OC2Z7iTNY1pHs9/RlMK29B7jUcKHYhJoXLy8XnkcwGuCwGjIQwQM2UcK0kCCDltcAfO6/I9KrehgDwVIlsxUSQNS+EARc0I9YY7JMdP30cmwVw+vK3RNxEc+nHpRh9BICNKt5y/Nk1rtyVrnluw=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR04MB8007.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(451199021)(316002)(33716001)(122000001)(41300700001)(71200400001)(8936002)(38100700002)(966005)(33656002)(6486002)(5660300002)(83380400001)(86362001)(38070700005)(54906003)(186003)(66446008)(26005)(53546011)(9686003)(1076003)(6506007)(2906002)(6512007)(76116006)(66946007)(478600001)(91956017)(6916009)(4326008)(64756008)(66476007)(8676002)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?b3pIWHFSZGVGSlB0SlF1TVB6Uk5rLzNUc2RJSDhBODRLOTlUaDBUWWxhZWt0?=
 =?utf-8?B?RncxS3crNjZqTkh4QWxBaUVHV0NUOFpSc3BtakZwQ1ltRzlhNUxSZm5LcHZB?=
 =?utf-8?B?SmN5TUxQUDJ3SmRaOEQ5OHFVZGR2amhpYVI4T2dxTHBxVDhHeGRWVnhyb2hB?=
 =?utf-8?B?ck5BMGYwb25iVGRQSFlndmVuVEhvZ2l2YVBrUWJva1RTUlB4WlNIaVVFd1pS?=
 =?utf-8?B?R1RSTWVvNmlkTVpnKzZLRXE0YmZIamNxTzBSaVJFNDl3TmRyd3NjTEZXaFJr?=
 =?utf-8?B?eXFnWmJzeDJxWWFCb3Z6Z3hFb3VBdERrU1A0V3pqa0IycVgxd0RDMVJMeThN?=
 =?utf-8?B?eXlDL0Y1Y1YwdzBrWEx3RkE1UkVKeXZHNUtGUTAzWG02RUx2TFRrTzFLZDBl?=
 =?utf-8?B?L2lEb2M5b055eUl6MFgyZDZVZS9vM3hwcUdqeVpKemZxa1RKZ2xoWERkRXcz?=
 =?utf-8?B?eGpVZmFkWWsvdkpkcnZQTTRSM09FbGdvM2JzSktPVllodVo3L1l2UTEvd2E2?=
 =?utf-8?B?ci9XOVphN1FrVFVQUW1Da0E5WDN6THRkMGs0NWVXanB6UHJiVHg1OE4ySWJq?=
 =?utf-8?B?MHFXNStIcnBQV001andpMEpQODZzejBRM3hnRnZMMFNkTmZuZ25laDRKTW1K?=
 =?utf-8?B?L1h0NWZxdUJwMjZwazViajZDZlY3MUxsOUNTTmRZQkRUUWRvc3Vha3Z2Y0Zo?=
 =?utf-8?B?T2pLK2pkcGk3bmhHZkVsTFRDVnhBZDhObEUyKzNUeFdheEUxRlNscXZ1K0FL?=
 =?utf-8?B?U0hSaHBxU251Wm90Q1M4ZytacmREYk1VcnlHejZOVHFpejFhSmFOOHNleS9a?=
 =?utf-8?B?MTJUd2lOanFmTlNpNWp5ZXBac3NtajF3Smh4RWZ5RE9oNnkrLzJhTWFnQkh4?=
 =?utf-8?B?UXd6NFpLNSs0WVdUVFhYNVB3eEhRV1MyYUg0NWtWTVFzTDc0YmEvSnkya2pB?=
 =?utf-8?B?RmJERmFISk0wN1BROTNtNkVRcENQTW9KMFJpaFBSZHgxZzhuQVM4MnhBbkdH?=
 =?utf-8?B?MXNLU2U0cUszeWtuVHBJSnlTNnIwRmREYi9iMzFwd0FsaStQTG5SV1l5VnJT?=
 =?utf-8?B?aGZNNjR5WEZCTGY1ZnNNY1hiU2xXYUZZQXdhNnZOckpQWWNMQUk3WFJSNjBM?=
 =?utf-8?B?M1ptbndaSDhTL21idkhWekpUQlJKMTZQOTBsdWxWdEozQWxmUHQwbmNqRmVy?=
 =?utf-8?B?d2NkWjBNRFlnbGcyc2oreDg1aFk0RWx6eTd5K2lEbk1DRWw5eXd3TS93dXJw?=
 =?utf-8?B?VG9sWjdOUzVZVmhJdDJSbUlKcmR4MnR6MVBQK2dlUGhIcVU2UkRvOUEzSW1u?=
 =?utf-8?B?dG5nOWI0VmZVNUZJMWhUbGxLeUx2UUtEenoraGljdkUvNWJESU16Y0F4cTJs?=
 =?utf-8?B?OEFMYjdFQ2QvT3N1cVcremZUZ2FLQy91UTIzUE9maEJBVzI2VjBEbm45U3Vq?=
 =?utf-8?B?MVhieTJuSXg0dFZFdGNPdEsxK01Xa1BOWkVReFZlWFNRcEU1dTZBeWQ0TUZa?=
 =?utf-8?B?Qi9yN1lTbDVDTVU3dmVwSkRvbVRDWnZQaFRQdE1odjRBSlM0d0lyaDU5UWxq?=
 =?utf-8?B?RmhtbjdKRmxHZndhNkpGb3NMVlNXcDhXL3pjM0NjR01qWFZKa25ZVXF4d25o?=
 =?utf-8?B?di9RRUJJTitaZG1VNzdDcGNySGEyUml1cm8xMjk3SHk3QTB4MzkzQlM2QUk5?=
 =?utf-8?B?WjZxMmRDR2VjQXErM3dBcU1oR0U1K1ZQdjd4T3ZnVmF2bUhGYWFEbjEzd1lI?=
 =?utf-8?B?djZNb2FZelRhQkxDQlplY05Kc0hGeFQ0ZmhuQTJIQ1N4MmlScmZ6MmxkY0xI?=
 =?utf-8?B?SjFFWkFqODViU05WVTR6bWQvQVNFU0w3ZWRYSHRrWlMzK0xKUkR5RmltQmx0?=
 =?utf-8?B?ckpFRnJXWXk4cTJ5VlNLY3l4enVmbzhsWVNnVXVrMG9VWjJ5QlZrTCtXOTZu?=
 =?utf-8?B?RkxwVDlaVmVLU0pkUkM4aFcrRVdHMHBzRE1IaDNScmRNU1JVa2FOUDVhazRW?=
 =?utf-8?B?WWpMK01GQXUxcjRvUy9GUThBMjE2YmY2T3Fza1NYSisydHB0bm1ZVmErY3ZZ?=
 =?utf-8?B?Z1Vac1JyMlVhL255WWdVYW5VRzgyTytwMDRNMEVOMjE3cVUzQjM3c09JaDc3?=
 =?utf-8?Q?JmWC8wz9X9J48h97GEXeBqXR6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9B5C5EF80CA0494EBC0E6DC09B084AF1@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	R63h2y996GqHCaY59xZV++WIgQjgyI585wocFcP3WqLZp3B6+81BfZmY0zUGElyx8QFXizbduwKCxwuK2nd6GsWQO6oGFfQqZn8L+c+UibZYnwZmwah93JN++wyQMHu9iVg/xAQqGJ/8xrf9tOh9PWkBJsX4g+xIaTh/a6zm83EVAFRhv/D59CMDuFnPtB6HVcKZNuo5ovC7vfBaXstgpvb88YAolwN0WgqpyEmxI9mu5huj0iJ3gmKVbFeRdeHXW8v8/9QcpIgrcXnWbNTrKBaVjLJNyNnJsi8XpUP+kALkWIyVAcjrOsYL9wsCDzO7WMpnBEp5AgdkM0G1zB38DA9cLHJXfZWRSFXCfiRUNBBs5Hq8KZc+3UwenZLMs04N340laHiN4t/zlKUOPYSOXmxHJ3t6f8PoWfP1U+9DhrzvwjKihqY1qYIheS6gQfcnFyTBrwKCROmFM127KsFAxlkgrH8CXWUI2CeSz6qhqIuG7sOoS6NU1MshTbMnW99K30Am6gnAczfa7YTUpfzHKTg2BEUBYBmMshQLNk15AjxOnX/MNyv851mTIk6aYfw1mZxZXdO+JZSjD+CHdVPCSZCvrBt8c+8VuwyId7Ok9fR+9gUjfCKq7vYb5mvg6BP7AUW9bpGf7s2XN+AEt0NZUVmgdzbv63nZ1sykkhWpLT+8ZFBJ3WX+Rf+eHN3Kf6BuqMzhciicmQ63rkqoSh36HR2Av7+HifyhH6TW0FlN5aaYto6Ry5YAiLBH+I+4AE6fY0stxeZYJbdR923d2i1FdErmyF0mfKKYqGp2Dr3jndysSDfd05rcFEnAQo226zDOoDiZTh69bv4yFFBk1jWRxXyzL46rJ5PcV3WFhlJT84dwkln7r63gEF1+snmixRqP0swBMkYVK4Hl6Fnoch0SBg==
X-OriginatorOrg: equinix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR04MB8007.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ebae1dc-f56f-4741-f401-08db37b46aed
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2023 22:07:03.0334
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72adb271-2fc7-4afe-a5ee-9de6a59f6bfb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fsWPwwFWz/asCmzqBA+eS6DNKqWaT6yaU18WQ5eiSxFq9TUPt/fTUB7fsd6bPVZaeie3svZOKAncWYEHZtLvmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB6971
X-Proofpoint-GUID: kytAPtPakN0-Gh2D2hKXl5_8rs72f_XF
X-Proofpoint-ORIG-GUID: kytAPtPakN0-Gh2D2hKXl5_8rs72f_XF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_14,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=452 clxscore=1011
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304070199
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

T24gRnJpLCBBcHIgMDcsIDIwMjMgYXQgMDE6MTI6MjFQTSBQRFQsIFdpbGxpYW0gS2VubmluZ3Rv
biB3cm90ZToNCj5JIGp1c3QgbG9va2VkIGFnYWluLCBBRkFJQ1QgaXQgd2FzIG5ldmVyIGVuYWJs
ZWQgb24gYXNwZWVkIG9yIG5wY203eHgsIGp1c3QNCj50aGUgbmV3IDh4eCBwYXJ0LiBIb3BlZnVs
bHkgc29tZW9uZSBlbHNlIHdpdGggYXNwZWVkIGNoaXBzIHdpbGwgY29uZmlybQ0KPmZyb20gdGhl
aXIgYWN0dWFsIGAuY29uZmlnYA0KPg0KDQpZZWFoLCBJJ20gcHJldHR5IHN1cmUgdGhhdCdzIGNv
cnJlY3QgLS0gbXkgYXNwZWVkIGJ1aWxkcyBhbHJlYWR5IHNob3c6DQoNCiAgICAkIHpjYXQgL3By
b2MvY29uZmlnLmd6IHwgZ3JlcCBQUkVFTVBUDQogICAgQ09ORklHX1BSRUVNUFRfTk9ORV9CVUlM
RD15DQogICAgQ09ORklHX1BSRUVNUFRfTk9ORT15DQogICAgIyBDT05GSUdfUFJFRU1QVF9WT0xV
TlRBUlkgaXMgbm90IHNldA0KICAgICMgQ09ORklHX1BSRUVNUFQgaXMgbm90IHNldA0KDQpJbmNp
ZGVudGFsbHksIG91dCBvZiBjdXJpb3NpdHkgSSB0cmllZCBib290aW5nIGtlcm5lbHMgYnVpbHQg
d2l0aA0KQ09ORklHX1BSRUVNUFQ9eSBhbmQgZGlkbid0IHNlZSBhbnkgbWFqb3IgY2hhbmdlcyBp
biBib290IHBlcmZvcm1hbmNlIG9uDQplaXRoZXIgYXN0MjUwMCBvciBhc3QyNDAwLg0KDQoNClpl
dg0KDQoNCj5PbiBGcmksIEFwciA3LCAyMDIzIGF0IDE6MDXigK9QTSBXaWxsaWFtIEtlbm5pbmd0
b24gPHdha0Bnb29nbGUuY29tPiB3cm90ZToNCj4NCj4+IEl0J3MgaW50ZXJlc3RpbmcgYmVjYXVz
ZSBJIHRoaW5rIGl0IGhhcyBhIGJpZ2dlciBpbXBhY3Qgb24gdGhlIDh4eCBjaGlwDQo+PiB0aGFu
IHRoZSA3eHggY2hpcC4gQUZBSUsgSSB3YXMgaW5kaXJlY3RseSBjb21wYXJpbmcgdGhpcyBhbmQg
aXQgc2VlbXMgbGlrZQ0KPj4gaXQgZGlkbid0IG1ha2UgYSBodWdlIGRpZmZlcmVuY2UgZm9yIHVz
IG9uIG91ciBvbGRlciBCTUNzLiBXZSBoYXZlIGl0DQo+PiBkaXNhYmxlZCBvbiBvdXIgNS4xNSBj
b25maWdzLCBidXQgdXNlZCBpdCBpbiA1LjEwLiBJIGRvbid0IHRoaW5rIHdlIG5vdGljZWQNCj4+
IGEgbWVhbmluZ2Z1bCBkaWZmZXJlbmNlIHdoZW4gcG9ydGluZyBmb3J3YXJkLiBQcm9iYWJseSB5
b3UgbmVlZCBhIGNlcnRhaW4NCj4+IGFtb3VudCBvZiBzdGFydHVwIHNlcnZpY2VzIHRyeWluZyB0
byBzdGVhbCB0aW1lIGZyb20gZWFjaCBvdGhlci4NCj4+DQo+PiBPbiBGcmksIEFwciA3LCAyMDIz
IGF0IDEyOjEw4oCvUE0gUGF0cmljayBXaWxsaWFtcyA8cGF0cmlja0BzdHdjeC54eXo+DQo+PiB3
cm90ZToNCj4+DQo+Pj4gSm9lbCwNCj4+Pg0KPj4+IFdvdWxkIHlvdSBtaW5kIGxvb2tpbmcgYXQg
dGhpcyBjb21taXRbMV0/ICBOdXZvdG9uIHNlZW1zIHRvIGhhdmUgYSBsb3QNCj4+PiBvZiBkYXRh
IHRoYXQgc3VnZ2VzdHMgdGhhdCBkaXNhYmxpbmcgQ09ORklHX1BSRUVNUFQgbGVhZHMgdG8NCj4+
PiBzaWduaWZpY2FudGx5IGJldHRlciBwZXJmb3JtYW5jZS4gIFRoZSBib290IHRpbWUgaXMgYWxt
b3N0IDUwJSBmYXN0ZXIuDQo+Pj4NCj4+PiBJJ20gc3VycHJpc2VkIHRoYXQ6DQo+Pj4NCj4+PiAg
ICAgMS4gQ09ORklHX1BSRUVNUFQgcmVhbGx5IHJlc3VsdHMgaW4gdGhhdCB3b3JzZSBvZiBwZXJm
b3JtYW5jZS4NCj4+PiAgICAgMi4gVGhlIE51dm90b24gY2hpcCBpcyBzcGVjaWFsIGZyb20gYW55
IG90aGVyIEFSTSB2YXJpYW50IGluIHRoaXMNCj4+PiAgICAgICAgcmVnYXJkLg0KPj4+DQo+Pj4g
U2hvdWxkIHdlIGRpc2FibGUgdGhpcyBhY3Jvc3MgdGhlIGJvYXJkIG9uIGFsbCBvdXIgcGxhdGZv
cm1zPw0KPj4+DQo+Pj4gMS4NCj4+PiBodHRwczovL2dpdGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1j
L2NvbW1pdC81MmVjMzdkZDBiODc3NmNlN2Y0M2U2NWUwYmU1NzhjMzYwNjM0MGI3DQo+Pj4gLS0N
Cj4+PiBQYXRyaWNrIFdpbGxpYW1zDQo+Pj4NCj4+
