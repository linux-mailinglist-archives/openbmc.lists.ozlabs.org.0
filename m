Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25510375D4B
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 01:06:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fbq2c0S99z2yWs
	for <lists+openbmc@lfdr.de>; Fri,  7 May 2021 09:06:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=txaM7iev;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=os.amperecomputing.com (client-ip=40.107.94.137;
 helo=nam10-mw2-obe.outbound.protection.outlook.com;
 envelope-from=thu@os.amperecomputing.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com
 header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-amperemail-onmicrosoft-com header.b=txaM7iev; 
 dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2137.outbound.protection.outlook.com [40.107.94.137])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fbq2G0VqHz2yWM
 for <openbmc@lists.ozlabs.org>; Fri,  7 May 2021 09:06:12 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/q97D7IzskbFEKXPQtq9cI1Triuc6eM/iBC+8ZK2A0QQFYeIXZkRNWxZ18Gp8LXa3+3VAwMdb5DPvbD7zfkjEEs2eXH0hbVnWh+kAsDWx1I6iqyGG5m8msFMgpizVOcwD2G+GyfoFucr4VYvvTNqEJhd+tpXYcqw5Q9uRkUGgWxuv/9zmAVXvzZwQHxyTekL7c6rrxDOC87496OdKVNfVlOem25qaf5SN586/1/yhVnWox5rvYD9VtSc7Tj4lFzoNEAhmm5+AuqGAfGsyl7hCqzoIfH8Cv6INlbLwrD6R5SsoDrpcj5hjZZzE4kKc3yJbw9FxVgxNYdgjG9wiAjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmiL5qkHdlI+oK253O4yX2R0uXK2IeM8EjGX+seIDcM=;
 b=g7Mc+22BxDK2VgMY3mk20lZ5Varegyo/aGCPJbbzIDj26/dFSo+nNyKLgWoiKFyAoIizgdn9oaX78jy1aobxGZjI9pkzyY2/jcgaIwt/yBLe1aHi880uhhZMsmUdaxQKY7/Z5yUnATj+mK1izVLWbGdq4/rFnuz6tfTgBPYmKFUmOwvSAvBBt3rrjNS13QK3NcJmbbW55kpWWeZga2LpAbe0ks+C9fU/75BLmQ8GabTqHeKqVxwVsDDedUt9OsGse3NB23+h23XZFwuk0fIwrmpSMxB8uBnIulTRuuWhpGipmBbdwsiQllQZOpe2CzaOkR9jN66TVQvTZYrkk6I3FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GmiL5qkHdlI+oK253O4yX2R0uXK2IeM8EjGX+seIDcM=;
 b=txaM7ievubcsUfrMx+jBU+9gsy46ES4G7DCZMn+AS5LGzU/l0CdEa0sAzjEkosx2rfPwvlrIrrER8t5HGCG+K94XpjYIbRV8fmeLAVE8vfeoCr305RZDLAQETi/3TvBEdVrNPQLV/iA4Q1RgV9vD3moF4sNvm6W/KQp1ZJcWO08=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=amperemail.onmicrosoft.com;
Received: from DM6PR01MB5145.prod.exchangelabs.com (2603:10b6:5:56::16) by
 DM6PR01MB5835.prod.exchangelabs.com (2603:10b6:5:14f::27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.27; Thu, 6 May 2021 23:06:04 +0000
Received: from DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d]) by DM6PR01MB5145.prod.exchangelabs.com
 ([fe80::fd97:f560:f2cf:d58d%5]) with mapi id 15.20.4065.039; Thu, 6 May 2021
 23:06:04 +0000
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 Patrick Williams <patrick@stwcx.xyz>, Matt Spinler <mspinler@linux.ibm.com>
From: Thu Nguyen <thu@amperemail.onmicrosoft.com>
Subject: [Virtual-sensor] the issue of exprtk lib.
Message-ID: <d0a99e95-6055-c791-a5c7-43d27a8e7f9d@amperemail.onmicrosoft.com>
Date: Fri, 7 May 2021 06:05:59 +0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2402:800:6344:392d:b870:c275:a0a0:93c5]
X-ClientProxiedBy: CH2PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:610:4c::27) To DM6PR01MB5145.prod.exchangelabs.com
 (2603:10b6:5:56::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2402:800:6344:392d:b870:c275:a0a0:93c5]
 (2402:800:6344:392d:b870:c275:a0a0:93c5) by
 CH2PR10CA0017.namprd10.prod.outlook.com (2603:10b6:610:4c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 23:06:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c36f89bb-d7ff-4288-9972-08d910e3862f
X-MS-TrafficTypeDiagnostic: DM6PR01MB5835:
X-Microsoft-Antispam-PRVS: <DM6PR01MB5835D9462E2CBFE778A3C9BC90589@DM6PR01MB5835.prod.exchangelabs.com>
X-MS-Exchange-Transport-Forked: True
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wt6abZe87Ifm5IIJREcwZUQheTVinkBYHQ08Tu4SA6OcgBJylTM2lYjs3D1pMyVPIm9Om1U8ZM9M7wK7meRjJher/r+g1dKDA0pRCzNa4iFuKPqvlgJpt3j7Fw066nM8a1QNR7veebpeTcG/v39eKtbWZXBMXdesePcd2OaZbqNmVODCeZ0i66jkwP4dfiuVwW0EodDvD9sLFWtmWuFRwPsAuSd2sbiEZs4SKu0+JLpbv82hb5og3/CkmZc45jieg7v5Gpq3tJR0t4/Nas7SCYnY65ZYBRuVNENq/7UpyXfDcw6nXTjirAy34KL3Yhrf+oPfjEHqS5XmuZ8sglferNrESTD+AfRS1EfW8LUZ17I3VMz8h15tBMm1+jNCKbZOTTtPwhQBpnhR+QbiCRfh/7EktGcXDihc0TAbLNKMU8F8MsHWimaCXaELz8d0f+oC66RbslEdZh/0DtBLL9d3jyFjqdijg9TmxrmfExR4/m2uU3slspd8mTEodVe+2HQfE3p7q2rB/x137RwnvPJSrgw3drwtvGn3nf/avTbjeZ9I4BdiOHk+uJfE03qLr57Z97t89eSUmfMWKal9oW22HtnrSNF5Xx8go4HbnaHpTEfI5foJIe3gMhZmDKYlm+77SiEs8hIkoBPLuft17Q52RW+KsHbJPCR5jIstDZYxWzceVmv5OvNlX2nlisxSFzW4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR01MB5145.prod.exchangelabs.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(366004)(346002)(136003)(376002)(316002)(31696002)(478600001)(186003)(66476007)(16526019)(31686004)(6666004)(4744005)(6486002)(42882007)(2906002)(5660300002)(8676002)(83380400001)(66946007)(38100700002)(66556008)(8936002)(110136005)(2616005)(52116002)(83170400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Wkx2TURPNmQ3RXJTZTNjbmdwTXNJYmdaQ0dtVng4bk03SXZWV2JHK3NVRUMr?=
 =?utf-8?B?SkRocVhYbGpmRlpCRVgwUHBkYnpZalhOM2hNQzlYcS9aekpka0R3d3VSaU9k?=
 =?utf-8?B?d1BET21Wa05CZm1TN1Q1T1d2aUJzMlpqS09IZCt5Nm11MGNuTDIzcmRiVWUz?=
 =?utf-8?B?ZlArbkgrRGFmS2FTd2VEQmJnVmxhaHBlZFFjamxoUE0vdmloNERscFBGZzZr?=
 =?utf-8?B?STJTYVEwU2UzL0F6R0FUNUhIK3h3bTd0Zm5Qd3dpUEZRKzRXdU1WYW5hU0ZP?=
 =?utf-8?B?REs1andPYi9IVUp1WklQQ3EvQ1NiQjZYbXh3RlJ4V3Z4Y3lyNnM0SDBHQ0R3?=
 =?utf-8?B?VE8xTjVXVlZET00zMzBjSXVnaFFOcEJ3T2ZqVDlxRWxWaVlQbXUxWHdmZEtM?=
 =?utf-8?B?cytRaVlVaEErOTNmVTQ2YXhudndOZmY3am1YSWZHSzJQK2UzTVpSZWc3MEtZ?=
 =?utf-8?B?eVI0WEkyb3RjSDBEN0xJRVBldXVqSU1nazV6aTNWM1J5cGpnR0Z5SFYybUNK?=
 =?utf-8?B?dXdBRFhJTWdaKzFZa2IzVWNubGNFSDk1NHNtT25KTUhGK05MVHlScnJDdXdV?=
 =?utf-8?B?dTVqWFEyRVBxNFZVYjN4MU9nRDNvS3RLTVRBRGRRd3JiOXhpS1oxNUxOcXlP?=
 =?utf-8?B?OC84RWtZT3R4L2lOWVZYUkkvMUZJUEdJOWtGOVJPZTBKdjZWdEFsVm5Da0Nt?=
 =?utf-8?B?TGlZR0JPK2g3NmdicXQvNWFSaFRydWxGd2JFRXNIVnltU3lENDA5aVRvU0JH?=
 =?utf-8?B?OXVUT1VialZEbDR0eEpTR2pBOVFKL3RhL2VEWVdEZUtxaDNSa2FPNTNVa0RS?=
 =?utf-8?B?L2pKQkF4RkpLOW1MbW0rSTdCZ1JMWDdnQU9LeFNVN3NhUTlRVmJya1Yxbm42?=
 =?utf-8?B?UlU0YmNROUhXYkYyMWVra0VHMHpNR1ZxTTF4N1ZCWUtYUlBGWm5oV3l1TFB4?=
 =?utf-8?B?dURkTkRPR1IrVlBkamQ4TG1IRFBBN2k1TXVXeW9UVHJCdnJBMStyblRGbFk5?=
 =?utf-8?B?UFhRT1UxdlRCYzM5ZlhyeGRHazRiNDNaTThoQlFFSExjT3phSlFZcXZmbitE?=
 =?utf-8?B?MTBNVDV5b3dldkVFRWJrcTFmTVN0NDk0RWc2ZEZvdkh1QUh4Qm9aLy84OW1T?=
 =?utf-8?B?SDVWUmZkVlNTVHZhQ21pWGtYR2ZDYmcyK3RvMHNLMkNwbVNTKzdjUUJtZUZK?=
 =?utf-8?B?ZUFhazMreDA0MHlJSnJIdGVrdDc1VUdJMGVRdkJDQWU0TWlmVFQ4YjZvMGFE?=
 =?utf-8?B?ZEZ6djMvendBaHZQSDlBTmxEZnd3TUhpcVd1SE5Qd1ZRMWxHWDVQQmU0Tm5q?=
 =?utf-8?B?Nmt4d1hFQWEzRWRjTlpHTXFFQWRJVlhHRmNvNzhJNkNHZzBlMW5ZQzI1MzRF?=
 =?utf-8?B?UTA2WFBPaDRUWEo3clM0cnM5c25xRkQ0Mit4OVhLay9qaG1nR2xiTFI4Zi8y?=
 =?utf-8?B?Syt6b1lrc3FxK1ZMejVnNWRrOURwMThucThxWDBKckFtTW9hdmhZY29heG92?=
 =?utf-8?B?cURncWV5dTVtTEpFL29IeDdSZHlTM2tzMDFyTTZIWVNaZ0g4dFo1c2YwNHd0?=
 =?utf-8?B?TFZNSlh2bTRNZnBoQnRYaE1BSTVBSUp3aWF4alBHNHFFL0lyZWNVbDJQOVVu?=
 =?utf-8?B?R3lHZ3A1Tno0QTdoSDVLN2J0ckpZWkx0VWZQWE4vU3JHb2piYUNBbnJ4bGNZ?=
 =?utf-8?B?UjNMVmVvTEtvVkw3cDVaTmxPVzJuUy9wSWZZVFlZc2NEMWJEdkhCUmlHTm15?=
 =?utf-8?B?Q2FnUkNqeGZmUVV2bTdvb2tGbk9tcnVsby9QeU8wMmhsc3RyL25acS9LZGxt?=
 =?utf-8?B?cVhiSUxnbnhUZCt2alNlWXJTRkpFRGM3OFN6dVJBUGJIY0N5b1VpZkhjcjBM?=
 =?utf-8?Q?u7/EgGYz+IwUC?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c36f89bb-d7ff-4288-9972-08d910e3862f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR01MB5145.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 23:06:04.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEz5Ct4oq40yYUDyCcKbEIbOI721XVQlr0b9l5hl8kHGNLVHoa6Iz1vQA/zyac4Fegu8KTTCXQLAh6uowZ5YssAcZFLSXHmjm7o5k0F79ZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB5835
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

Dear,

I'm supporting the virtual sensor using phosphor-virtual-sensor.

The expression of sensor e is max(t,x,y,z). When t is nan, the value of 
e will always is nan.

I tried to verify the exprtk lib and see this is the issue of lib. 
Please see below test:

/exprtk$ ./exprtk_simple_example_01
max(x,y,z,t) of  x:37.000000, y:63.000000, z:13.000000, t:nan is 63.000000
max(t,x,y,z) of  x:37.000000, y:63.000000, z:13.000000, t:nan is nan

exprtk$ ./exprtk_simple_example_01
max(x,y,z,t) of  x:82.000000, y:34.000000, z:92.000000, t:nan is 92.000000
max(t,x,y,z) of  x:82.000000, y:34.000000, z:92.000000, t:nan is nan

./exprtk_simple_example_01
max(x,y,z,t) of  x:29.000000, y:76.000000, z:61.000000, t:nan is 76.000000
max(t,x,y,z) of  x:29.000000, y:76.000000, z:61.000000, t:nan is nan

Regards.

Thu Nguyen.

