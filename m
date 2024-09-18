Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B73D697BEFD
	for <lists+openbmc@lfdr.de>; Wed, 18 Sep 2024 18:08:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X83Tq3L6Dz3bmJ
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 02:08:15 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c000::1" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726675692;
	cv=pass; b=EESHiFcrE23CqWmLzuZbOC+mpAmvoFOyL78wXJ9yZoW3gwY7fhjykMWazPSNXFF4n4FL2qFfP2D/20HXH9aKM5mmhdpbaDTkm/eCBOOiw/DVQOR23597csEnlh9dR2m8OZgZ+3WKI6T8+0aZz5YRx403MesFo8wogW8TdTAE5YHaqjH0KBSOEVYYX5AmIj69aOAWIRhBWWdK5vcmzrpl5ohvnQwEDTmoromjkgXEAnJQEtIaP7E4u7lPGwZ1Tz0GNPG0Pa8AyrEIZrPeEJYy8vhk+kupdmPtZalOnp1tPjhillaAh+4FjPr8aQUGG3tte1reLOC+n9s8dNujlIq7PA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726675692; c=relaxed/relaxed;
	bh=pjh1VDW9eD+FD4e7bwhl0L91NAapKvQXw221/hcy2To=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=di5Hrs0it12aFBHggIboc7utPpo7zVjbc6t3tr6DU/VCPzcamKTRTQ82GtHieUVSo9HECpd0shIarHSQ3CQfnBWiYbaSbWLy3mri0DaQ2eY319pZy29BfEK71MyURVunVZzB9fsUhGeiQJHOMhkpkiV94iRZbMCUP1gp5uag6eRNYnsJLwIg+sIykIMMNpYmkTS+5AXyl3myoOJ6FMj6xqzWdyXCqiRVVn0s03YgjoXI47EZy9bhbI6j8C4Ect7ESIBsqw90JBDXhp2oafHDKpuFbGnNNMv7FSWNaC/D2JF8aJBhf4QXMjREXhZ4ZW2+uvRDlqvMSiZgyOL9KuOAUA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=IDKXM3hJ reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=IDKXM3hJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:c000::1; helo=byapr05cu005.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c000::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X83Tm4dZhz2xCC
	for <openbmc@lists.ozlabs.org>; Thu, 19 Sep 2024 02:08:11 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aacqH3zPZM7l0+2ynxYsjRrQi36i28z5Jf0acbhBUyN010sM+cc9eWsxZ5hQCui2dlUQOLGNAhSNApDuRDQfyxCSaj6CXFQUhb3WxnT9COhNuI62vPXnU2F+K7Bql2mMrBQyfsvweQiLaueS/h+oQzrWsrcbpEzJPQeX1EbsMS7CYVq3jaSbkHt5fx3qMyiNC+6BMcpIb0tx5WdVU5DkrVFA0xD0HYJLy441jqCbjTybQPMmNaCbXWodjg8GGMl75HmTdbgXVVlt+mEgTs7ikuebvK/d4vNarykJpdPJrQsHM5nNv+fAfIW6DR3+ayGY1cFNTuVEensNxKbIv+/KRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjh1VDW9eD+FD4e7bwhl0L91NAapKvQXw221/hcy2To=;
 b=Rqq219MXJRO7ZZeeIXmHa6mN9gcJ77eINA/iKgtl7KMF9ROA+OHZV17hz0SWOH9rYwVjr5feM/yZHfZDJwRWKp6FTNZZpWciPGBgHU1JipuzqTZV7Aq9qHKI9/bxdZnIJf3WgZWajEdlHgN/NKpzxOURku1o/qbrXXBAd79pJ+4qbUgkuc77+Ee+HTZemZtevR8Avcj9cmDKPNsFbs2/jK3nYaKBDAleZjietxUxaCZWTEOOg1mrqNyxpkIT2lhZz7CHz8sFxD9st1najNihJsBNRnzqANa7g77HjyzLzNYTfn1+EsL3COKqJuqWMKkZAD0AuzgvoW26HF4p0E3APA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjh1VDW9eD+FD4e7bwhl0L91NAapKvQXw221/hcy2To=;
 b=IDKXM3hJ9YgH+kiWU/niw6DMdjXF4ldyNOE1H3wDsBM0HM5dUs2DpurN8Na/RcgIXKr0zm3CSxibYqFt00SysHE0/7rpohRvtyc88s7anVgZ/J9I+fka4cfIbkpZJMYAxYsVboN4SG0J8yfVmYpk5LUtpM25fErHX8hcPuM0BQs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 MW4PR01MB6339.prod.exchangelabs.com (2603:10b6:303:67::6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.27; Wed, 18 Sep 2024 16:07:44 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 16:07:41 +0000
Message-ID: <6b1fd95a-ef4f-4d2f-af27-6c70a60754fa@amperemail.onmicrosoft.com>
Date: Wed, 18 Sep 2024 23:07:30 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 OpenBMC Maillist <openbmc@lists.ozlabs.org>,
 Open Source Submission <patches@amperecomputing.com>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
 <bc13d8fd-4f03-4445-bc4a-1e0ca7c23ef7@kernel.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <bc13d8fd-4f03-4445-bc4a-1e0ca7c23ef7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0446.namprd03.prod.outlook.com
 (2603:10b6:610:10e::35) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|MW4PR01MB6339:EE_
X-MS-Office365-Filtering-Correlation-Id: 393ebd84-d770-4218-e9f1-08dcd7fc061d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Rm8xMUFyK1ZPQ3BXbVpBYkZyTHQ1Y0wxQTY3eS9wdjhZK043YTkwYmRhdGRv?=
 =?utf-8?B?MnBqQWx3RmcrcCtMVzR1d2lkOWV3M25GbkNnVloyYXUvbzV4eTRQYTdROUli?=
 =?utf-8?B?L2R6TzE2UjY2Q3UzQjRJQ3Uycm5ncUFVVnNSeTZ2V0Q2UmYzMXRsUU5PbDhE?=
 =?utf-8?B?MXVmMjFYTjN1UzNvdjE5NXphaXNqUFlZZUxDRWJ4SmdJOXY1dkdEWVVCV0hs?=
 =?utf-8?B?OE1Oa1ZxRGpuQ0lCZE4xUU9heWFpUm1sNk15MEJnTDZuU2xwYWVvdmF3ZlJ1?=
 =?utf-8?B?S3JzVDhUbDhhSHkwNkNTR3FwUmg1QktHOFVzR1lCVGRwK001cWd0M1lybjI4?=
 =?utf-8?B?YTFGbHdkMnNDTlJHU0IvWkpTRHlydldtUDBaT2o0M081czZ2aXpydlFpUlN4?=
 =?utf-8?B?VXBiUUV4NWxDOUozaEVNanRwMzJWTEc1cmx3UmVpa0t1eGNrazc5MHNqcWk1?=
 =?utf-8?B?bFE5MjlFTUhqV3c1SDBTK3pFWmk2enMwZXYzcEFCQ3BQWXMrZGN2c1pEdmto?=
 =?utf-8?B?cmtrbHc0U0pXem5EQ3VvdmFFNTJlazB4SzRUcWV4Y0FrLzdSbnR4dGVIeVZ5?=
 =?utf-8?B?cHpxeWpsakFSU0Z1ZmV1NEFTS3AxbnFRM09yNGY0dVN4cVdxU2NvZXpmVi9w?=
 =?utf-8?B?NVlMQ2Z5RHJndGFad0kzZkRUTEtHd1FxV2FlbmM5VXFBd3F5UXUvTW13eG4r?=
 =?utf-8?B?aUlJMWt6SncrRU5UT3RsWU1LTi8xNUxmckw0cEFoWmRRc3U3TExHZitWWEhS?=
 =?utf-8?B?Z0U5eUc2b0FIMnFHRzcvY2Zjd0dPTFZoTHptbGt1aFd0ekFtSGVCSUxhalpR?=
 =?utf-8?B?em9Ya0EzN0ZmcnVDSVJpMk1RcU5hS1BzZXcrUTdScnRwTkRZb25xcnQxYkt3?=
 =?utf-8?B?bXF5clJqZ2FlUGJrWXF6Znp1a1ZlWVhlT3kyRHNuSUZYRDBmekgwVTJPTGJH?=
 =?utf-8?B?cnM2WlFqcmJ3S2JIR3dvTWg0MzgvZzliRG1rODg0Q3dzNHl5TUl1V2ZqdzZw?=
 =?utf-8?B?czdBbStKV3BMbUJrbUNEKzNYTHFsRnJaWGF3ZmFBRUwvb1VzYTBOVmFQd09Q?=
 =?utf-8?B?Y2xSTjhyc2szSDNydVB5WjVlNmNZTVZQUG9lK1haRWcrblB1Q1NHaStGMmVN?=
 =?utf-8?B?aHl6eXFweUxoRS9wNkVUay9EUXlsRTdBdnNFU3VYMDFDMnl0ZmlVR0s4UHRF?=
 =?utf-8?B?YjZlV25iVmZOUm9vb1B4eDlnNFlQWlg0OURqSU9XdmVMNUN5OTRjRjdqY3Jp?=
 =?utf-8?B?czd0U2JpS2JFUElZRGxQQndIUjJ1WklnemttU05NTm9FcVMxeVAxdVZ4T3RP?=
 =?utf-8?B?SDJpZk9rRGVNTnI1Y2JFTTJRUlorQkxHTGszVXcvOXlUQ1pia0phbW5pcVlu?=
 =?utf-8?B?ZFRnaHZ3aHM3MUFiMEVsN1dOa0Z2YUo0eDRvYU5UMVpyNmtEVktzNjcycDM1?=
 =?utf-8?B?VUwrczBXdE5malg0YmQ4NG9rTHNBN2I0dm9NQ29tbkdUbEYxdFd5VFYvYTF2?=
 =?utf-8?B?emFFbW5TUFpSYzB5WE5qWHc5N2p3QVRTZVJjU1lSOElpV3JkMmxhOWJkWXNr?=
 =?utf-8?B?ZyttN2FlVmZhdmcvQkZZQUhzcHVFcGVlbmoyUzJ3V25BN24rMmhtTFdHS0NU?=
 =?utf-8?B?Q3JVYzlROWVtalk4ZHdZTzNzaVVWL3hkdi9pVlhXOTJ1dUhrK3FIRmtmdWR4?=
 =?utf-8?B?cERpcmpTMWsyTlc3VlZZKzd5Ui82SU5aYXlOU3h1Z000NTM3eVRtUi9LckZT?=
 =?utf-8?B?MlBHbHJoR2o0VmRySXZzWjhmL2F5WUM0SURKaTZ3M09XM1pCb2wvS2s5OFdG?=
 =?utf-8?B?dW44NTZReXJGeTBSM0lUNFB5VGcyYjNra202S3dVZDh2bDAwY2hCV0d1MnE1?=
 =?utf-8?Q?We6Qja1UfkHOt?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?QVFpcG1XbDJsMnllZmVlcDlWZzREbGp4c05BaVduczlyTkVPM3YzQTNKVVpa?=
 =?utf-8?B?aG9XOTBjUk5nTGxXYzFJMWZHeDlTYmE3YUNlLzVtT2xWRVM0TGJHNnpIbHdO?=
 =?utf-8?B?WFBwb3ZsQ2tVU2JkQVBpaFUwYXNSanhWbmZ2ZGp3Y3AxeXFyMERXNENjQnIx?=
 =?utf-8?B?WEZpWDU4eXBrK3lrNFNnUE1xc1EvSW5XcVJoR2l4Sk90akYzMS9SRXFKa1lO?=
 =?utf-8?B?YkoyQkJNU2pOcmdwa1dEZTU1V2czMjFIZnBrdzVYVUVuSmpiMFljQzlqZ0U1?=
 =?utf-8?B?ZWt4WFJhd00rUmp2L3NOdmRDQWxBYmtFYUMyK0RzeE10UkQraFRMZDlkNXBR?=
 =?utf-8?B?MXJPZVN0SEFnZDl2MUpFRkViVS9UV2NTOUp3OHpKLzJobUEwRFIvL0Q3c0FV?=
 =?utf-8?B?dkRMY2pBYzVvUmpGem1YYnBFTUVnQWs4OGtDSFJlVGxhZXRKUGp6Z3h2YkNv?=
 =?utf-8?B?MjA4S3BGeVQ2Q2MrNDhIQm1kdUx1Y2JidmpucHovOWhKQXZkRWQ3a1RRcUlM?=
 =?utf-8?B?OUZJbUNHRHVYMnBhb0w1SitQakRvTE9zTlRHd3FRcnc0Q2xWTzU0cFkyN3Aw?=
 =?utf-8?B?OTFTNFpjdlBpTm9Wc25neHZSL0paOHUyUGNHK0MwVHdmNHErUER3eFVZYzV4?=
 =?utf-8?B?WmFzN3NqcDc0cDF0bDhVU3dCVTErbDN1Ky9Wd0NKQ0ZPaCtuTVRJM2VrOFUx?=
 =?utf-8?B?MmdBTTBvSEhrZHlQYnhaQVNIYlN3TFZYQ2syVUdUOGxlNkZlWFlOVFQrNXIv?=
 =?utf-8?B?bGIyLzVnZFpiOHduSTVINnpqalpSS1hrQi80Wms3K3pJam4xS0d1ZmRnY0tZ?=
 =?utf-8?B?MXczaHpFaXc3blVpS3J2dEM3WmJKTk54TDQ2bzI5SytMSkJodzBISitUMy9m?=
 =?utf-8?B?OGczaWVBSHJlYjM2Rng1dUVFanNsajMwUnk1ckVsNFU3Wi9HaXpJc1pmRUhj?=
 =?utf-8?B?TVd1U0ZqRjQwWDFJY2lSUkZqNUNhVEtrNVpNbHJYODlGUkw2bUE1djFyVEhE?=
 =?utf-8?B?cGdZZFNLMDN1RkNyeFFuTTZ5WDA2VkJFVWxwUnFRTkVrTWh6RzhlQktEVTd6?=
 =?utf-8?B?c0FqWUFTOFpUeC9MYlV6Uk56ZGpSaXRSb25NcGJSVWtLbVhROFZnQlpsU0Yz?=
 =?utf-8?B?NTNOT21SMzJMVnRWTEFPZitiR2Z5MHJoM0VoZHpzdSt0TG9ScWs3dmdsRnR1?=
 =?utf-8?B?bThhbDJmRHlOeWpGTXFoV0grcXBWSExIL0ZwYVhvd2lFNmYrcEw3M1hoLzhX?=
 =?utf-8?B?N0FWL3JKNG1aVFBDeXpXcnI2ZThYdzRGb2N2RjRad0xZRnJ4azZhbU92MDA1?=
 =?utf-8?B?cU10eHZha1RRUm1BTmREcERWN3U0NExpWFNaYlUrWG50bE5HcG83WWRtYXd1?=
 =?utf-8?B?SER2TUx0akc2aldnZTFCVXg4T3NBTlJoaEF2Z0RxYUR3RVplNStsZUoyMzJE?=
 =?utf-8?B?U1RDaDZMOSt0NnRPby93VHdkZUh4UFcxcVBFZktlUnBIdjdYSTFpQ3ZGMGt5?=
 =?utf-8?B?eXRFcWJ3aXJKVEhiQWVtU2VPRWJSU2JkM2NrUWxJSW9USVB1TXRDc2J2YW16?=
 =?utf-8?B?Y004YXk2VVdWYzJ0ZFRRSkVVNEhyWUwvV0QzYzMxc3VhYkpRYU1nOW9WWTZO?=
 =?utf-8?B?K2YrSEhWeXNXclVtWHQrT2Qxam5OamRROWhKMUl0UzY1UmZSb09JVzJNa0N5?=
 =?utf-8?B?UUdzb3FoQ21SSU1wZW9tLy9qRHIzaisrN3A0dnBzWHpWYnZ6QUZjNFdTUUNa?=
 =?utf-8?B?Q1NtK3hxNzNuQlVud0s4TkVCMkJpZFJsZWZ6VDBYc3pCREtJTHViWk5mYm1N?=
 =?utf-8?B?WGZPaHRIL2pCQVd0NGQ1VHBMbnNqb2lPMlBZellRKzdZVzQ1MkZFRkxSeGUz?=
 =?utf-8?B?ZHhUNEt3V0JjeFJaRnUwRE45MitnRFZvcEZ1T3VJcjdxVGdvSWZJZ1g4Sk56?=
 =?utf-8?B?L1ZuYmE2TEg3TVVXK0JVTUlYekgrOGpOdTRCUGdVVHh4M3hPOTUrbU52K1pv?=
 =?utf-8?B?a1ZMSTBPMGtlbDJXcFFZS3BTVk1HaFJQcXdnTFFJZS9WOGJxcXcxVkIwNkxU?=
 =?utf-8?B?azB0UFJWSXdtWEtoaTZnVUlja2M3WmdSbTZPd0lsc0VjMHB0d1A4TUdNWkdi?=
 =?utf-8?B?T1RudUJDZlF2QWdKVGZaMUlrYnRiWmx5N0l1TE1iTmdlZkRMckdQMXI4RjBx?=
 =?utf-8?Q?QTnZmgaoPkmtXWtZs7tCAVU=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 393ebd84-d770-4218-e9f1-08dcd7fc061d
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 16:07:41.6591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7T5/9lEUigxaAoKfhFnv6WG1jalEX+IhI5XqgNBJmRKdTVVDHS7DvSzmHM/xoJVCjv9IN5hm0vIIKV45fkI0rIwBo7vuiS9LMdx4gPGoo/wK1DIhWykBIErUKSDZO2M3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR01MB6339
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
Cc: Thang Nguyen <thang@os.amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 18/09/2024 20:09, Krzysztof Kozlowski wrote:
> On 18/09/2024 12:32, Chanh Nguyen wrote:
>> Add device tree binding and example for adt7462 device.
>>
>> Signed-off-by: Chanh Nguyen <chanh@os.amperecomputing.com>
>> ---
>>   .../bindings/hwmon/onnn,adt7462.yaml          | 51 +++++++++++++++++++
>>   1 file changed, 51 insertions(+)
> 
> Where is any user? This is supposed to be sent along driver change
> implementing this compatible.
> 

I'm using this device on my platform, and I'm preparing upstream my 
device tree. So, I pushed the dt binding before.

I'm also quite surprised that there aren't any platforms using adt7462 yet.

>>   create mode 100644 Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml b/Documentation/devicetree/bindings/hwmon/onnn,adt7462.yaml
>> new file mode 100644
>> index 000000000000..4a980cca419a
> 
> Binding looks ok.
> 

Thank Krzysztof!

> 
> Best regards,
> Krzysztof
> 
