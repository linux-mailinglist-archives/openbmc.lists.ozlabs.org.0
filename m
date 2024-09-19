Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8E97CB4B
	for <lists+openbmc@lfdr.de>; Thu, 19 Sep 2024 17:03:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8f0B0hKbz3bsK
	for <lists+openbmc@lfdr.de>; Fri, 20 Sep 2024 01:03:06 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:2415::71e" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726758182;
	cv=pass; b=JviAm6gOBcrBLHyU/OFp+NQPtH7Kd4hhExgWEclJPPNB5HMtkAgZ6xa0oh5SjmsKYnRNPP1Y0MxGHyKp8aEQYqbeaMTVYpdXI2lOzu+W1hBS/GO8BNA55rjqkDNcER6V6iE3zX/hBN2vEHK0dNFIKxUfer0Eaf/2cUM0N8sei76tGnKpUY245dXVjaPJi17yCNv6X5ZfHMRpuqxb+m5A+LELx8DPj1VKAZJEBIcUTHjOiS1ZCNImwJ/p83ElOYs8yJGe1cSUkhOozrmHDO5h4VdfUO9KtEQtaNYQBY56KiH8PbC7Msh36w1KAzqdHeYMD2N8LWNoXDqRxGsPV2gYwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726758182; c=relaxed/relaxed;
	bh=hDC8EMFxRAY12G8oJ+082720qn1I59pWPz2lBl6GWu8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j2B4iylBoiSwi/IEkVQoGyiX3nZxo66QDwUKW4WnhADxOjdlGI3fDGa0HI/NdOCa3gnIHLRU/osxYrjbZcczM7RAsHTUbdoMjy9p8rT3oZ8naD91IjDfBpQjoQCT7ECuLRiDZCZHtFehG6IDKLC6IW0F6WjBPjuY0YiaZTy/j6KaLBXNwrimz1skgETN5Qv0fc6Q3uPCNnhJN+lzX4/3hVu1xFGA0xvgIfr/n14L7qy23iZ0iW75GJgjfRPaReH4k/HPURVlJl7JKTByUi1GJzM+Dl+bNy8Is6yk+ict/8TJnpGzupnvZATND8BXqc0j7nRgn8T6h/zL30DzCI1DQg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com; dkim=fail header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=jsUaBqf8 reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:2415::71e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=os.amperecomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=amperemail.onmicrosoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=amperemail.onmicrosoft.com header.i=@amperemail.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-amperemail-onmicrosoft-com header.b=jsUaBqf8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=os.amperecomputing.com (client-ip=2a01:111:f403:2415::71e; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=chanh@os.amperecomputing.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2071e.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::71e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8f056WK3z2yHj
	for <openbmc@lists.ozlabs.org>; Fri, 20 Sep 2024 01:03:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sKZ9y0WaRqs17C2JtLsT9+9ylt3cSeED/vVhcYm/t6egE5mQMmgWH/g1/nhziI1a4vZ1bS2yPMGvsCCAQjmLz0s+jp2sTs4dOaYBwq1Pf160PFfLJWEYVzEi2Wc4Ii3UrFBHWlVOydhVVzb2Wb8iZac+SBHPsePmeckK9e6PswqZ6w0ETq+vdeKfYu0A2K0oai77TMJgXwBB8pDwm/GUIZ3PdPvY4KzVJIgkB7J9YQtyQJY4euhx/bA7PCcG9AMSO5bWak3m+qX5kBZGonsleqpKgs+sTge0nmWTERp2wLISo5PwcTN8GUVjEaU95plR6HVHWEDfQmQauowHo60Ieg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hDC8EMFxRAY12G8oJ+082720qn1I59pWPz2lBl6GWu8=;
 b=S/xSgid7xmIz0VMSzL6a0M9t1y9mPFs/MscyLcu3gM68+yMi/l+++YiQNV7Cg3Fe1D/ryQfhgm8Fjs3+bf767qUMwQ5bZVhxpFZbcwN10RCUM1zR2rVIDtgBgoV5cg7nkHBjijE9uIxJUpqK4Og8HFFq38Ies0v2N9RlGz4gbrXDwEUPQjBSQ/DcQlko3/pNGYzaxdTzqIIH9Pusqk7lIVeORFWdiZskOdCZY3xPMn70s3tvBotoLtXTk7HNSBsNoC8HSjZtVCsQ7DaHaMFELrtQ2hYR5nOOJ8H4NElWm+pz4JiCff7OSAHw24hYXClO4fLNlI6a3rBvABFC85xBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=amperemail.onmicrosoft.com; dkim=pass
 header.d=amperemail.onmicrosoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amperemail.onmicrosoft.com; s=selector1-amperemail-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hDC8EMFxRAY12G8oJ+082720qn1I59pWPz2lBl6GWu8=;
 b=jsUaBqf8rT6wR9StZaSDjoX5xWxAVSuL7/OXLGZxJxusyr3vuPAPqcbaa/RJ53CPhTH/qNDL9xX+Jl1x1jqHiguvnjkRw/b3pJ8p+mbwIqXZgvvihgHYOdmyabCc+L6Cuoa9YHBlLUg75+VsPNJsJ7UVYzhBpHSDXrhl6ZYz7Hk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amperemail.onmicrosoft.com;
Received: from BL3PR01MB7057.prod.exchangelabs.com (2603:10b6:208:35c::16) by
 MN0PR01MB7635.prod.exchangelabs.com (2603:10b6:208:377::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.28; Thu, 19 Sep 2024 15:02:34 +0000
Received: from BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09]) by BL3PR01MB7057.prod.exchangelabs.com
 ([fe80::b69e:5684:ed7c:4d09%4]) with mapi id 15.20.7982.018; Thu, 19 Sep 2024
 15:02:33 +0000
Message-ID: <d1a2133e-92d2-492b-9a82-047a9fe80cf6@amperemail.onmicrosoft.com>
Date: Thu, 19 Sep 2024 22:02:22 +0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: Add adt7462
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Chanh Nguyen <chanh@os.amperecomputing.com>
References: <20240918103212.591204-1-chanh@os.amperecomputing.com>
 <20240918220553.GA2216504-robh@kernel.org>
 <d825a93f-be5c-45b9-a8d4-5c412ddec232@amperemail.onmicrosoft.com>
 <2229b659-c753-4f56-a1ab-7e8984f9147f@kernel.org>
Content-Language: en-US
From: Chanh Nguyen <chanh@amperemail.onmicrosoft.com>
In-Reply-To: <2229b659-c753-4f56-a1ab-7e8984f9147f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To BL3PR01MB7057.prod.exchangelabs.com
 (2603:10b6:208:35c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR01MB7057:EE_|MN0PR01MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: afe241e1-7d14-4e70-aaf4-08dcd8bc1738
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?WHMrYnZhMXNvM1p3MEUvdUk2OG5NYVBVbzRYYlBoVStnRGVaMkpCTkthM1FZ?=
 =?utf-8?B?NXpUNzcrVU8rWDJKMFNVZDNvSU8zR1BPVHpsWThWRk0wWEcxTVl1bEV4amw4?=
 =?utf-8?B?SkRNTjU3RmJOTisxUzV4NUZLTW40WkdGS3NCdlRmcldsL3FtOFk2ZmVmMGlW?=
 =?utf-8?B?NnlHVnBXQ2dobnpaSjhxZVRKOFFUN3ZWaGdxSno3UzhqampYeXFCcE1DSGZk?=
 =?utf-8?B?eXJ1UHh6Z3FleTBCY2xudFpVN3pibHBuM1dMVjZVOUc4OVBaNXR3U2loSFpt?=
 =?utf-8?B?cktXMUJEeSt5TTkxMDByTGRkcDA4V3Z0V09ydzdqSWVidWh4RER5NXNBS2M3?=
 =?utf-8?B?U09MZjlaNXBvOUc1UTZKOFQxZ2w2Y0lJeXBsSFNOalBjY2dPekhUU295MzVB?=
 =?utf-8?B?UmFmMzI5SGJBeDFpdVpyL2tiSEV3WmJ0Tkx0WWR5ZlJGZkxQczJpQnNtQ2t5?=
 =?utf-8?B?YmgxMG5zMjZDYWMyYjZxLzBsSDVtZ2k0aXlLUklienFVNFBiVEFXL3JWaXRV?=
 =?utf-8?B?SzNZR3hmQVZRaG5qdkRuNGVldE5HZ0ZRZFlCa3V1TThIUlJGNitRRXlwTnFG?=
 =?utf-8?B?N0ZGSEIvZktWM3dleTNyM2ZPRFUraGEwMXJRcHU2aWRRcnBXUzBVUGtqMVBu?=
 =?utf-8?B?S3hMdTdURFh4SERNMThmeVR4U0pmQ2psb1plK3o4Wm1jbWhVRUhlVlJhVDEx?=
 =?utf-8?B?YXhtYmNkRWh5Nk1NOTRHTTEwVXVadHZZWkZXSHBsSjl0bXB0RGpadkhiRlpm?=
 =?utf-8?B?aCszZmpMdWlHbXdESGlzSzlYaDhtYU5iM2tJRWhSd1hJekRtc3BnVVRtS2Rn?=
 =?utf-8?B?MkNuS0UrVDREajJNZTZveStrV0lzZjhBdjhUVzBkUWZQTmJRT0pxb0N1VFF4?=
 =?utf-8?B?RWZJTGlYRlI4M1NrV2FHZ0dPcFVFempXWWxiRFdCQ0p1UU44dm96SkdLbjY5?=
 =?utf-8?B?OXZrOERLeFFSemtKQXY5YmRBQmRoV0J5ZW5XZkZnZ3JVYks1RWM5bFNEMDE3?=
 =?utf-8?B?V2lGVXNsdThwckxsbjVDclM4a2U1SEFjR3ppejV1U3hmOVhjelVwTmwzWjJV?=
 =?utf-8?B?N0VSbmpmZG00SzRhZm95a2tKU3BwY0FQSnRNbjhXdzNoQi9ycWsxNFpzdkU2?=
 =?utf-8?B?YjFQQmgrTnJJQmRwWE8zbHRUOEI1VDMvODc1WFNrYitIeGV5R056SFppTUNa?=
 =?utf-8?B?SjFxMXBiLzUwazhERUpRVjFvWWxiblRNb05jSmxDMkdydVlzQ2g5RW9TQ2xP?=
 =?utf-8?B?QXo5ekM4bFFXZnFvYkxMc3FGZ2p5N1FoNG45VWdmVnVwbFlzaWFKdytqdDg5?=
 =?utf-8?B?dDJpbUJkNU14ZnRiUlNKZjRTOFFWU05Pa0lLSmRYWHd5TkpwT1gxUTlxRVFM?=
 =?utf-8?B?elVwaTYyZzU0d0xEYUZXbDJmbTZFbnkzK3dTYUpQdkI0SkNCT2RhcUwwcjBP?=
 =?utf-8?B?NVlON1N2ald2RXpZQ3FSNnFONnQwUU8zc0U1cTVLN2QwYk5LeHkzNVRYb1dj?=
 =?utf-8?B?Zm1od3RkT0UrWk12NHA4a3JhUzVVRWJPbmFlRU5vSTQvVVdlVVlIaUNSQ2Zr?=
 =?utf-8?B?SDc2aG5WbURkRG5RYldBVWZtMmVaZEFqbTE5T1dDOVZiekhMYTZITFZWUVBK?=
 =?utf-8?B?cW5nN0ROOVN2NFMwa0RGYjYyZEhjeWp0Ykd2RE5PVzhBWm5tdjIxSjdTbHNq?=
 =?utf-8?B?V05GWEdsVXg3aUl6b2VoaDd1MGxTS00yeGVmWXVHNC8yaU0reGxqcGdMQ0hV?=
 =?utf-8?B?OVhpaEd4NEROQlQ2czM1L2pmWHJ6ZzVuaDRvbnZ3YndOb2VxN1liaWpMRGw1?=
 =?utf-8?B?WElONkY5Z3ZLRDJPUDdaQT09?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR01MB7057.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Z2RtbFFjeXFUbTltakN3aHBHOTNGd05uVGRmRkZFVzJOTkRNOUJoTUwyQ3FW?=
 =?utf-8?B?VlVkVi80d2c2eWYyRmppT2gzVGJvelpMQlZBMDI2S2Fzb2kwYVpkVkwyWlVC?=
 =?utf-8?B?eWVBMFl6WVhDdGNTaC9FTy9FU3UyQTJmRVJCWDM5NjR2U1FvUHZkYUFyUysv?=
 =?utf-8?B?RkZydUtlT1BZWkFQL1VPNldHazQ1Q2hOcXFZa2V0QXNmT2JsZG9UOVFGS2Vx?=
 =?utf-8?B?ZnZuVE9hYUMxMk5jaVd0ZCtZYlJJZ1VZSU93M1NkK0VwbEdjRnRlNnF0WkhC?=
 =?utf-8?B?WkV1UWxKbHRiSEc0ZWhVT2Y2Ti81RFlLTmtodWJNK3A1clNtRWlSSEk2Uk0v?=
 =?utf-8?B?RUc0K3NLb0VMWU1KVkJ2NmlnV016T01YM2pqNjg3WXE2L3hIM0RzZ1VFYUFX?=
 =?utf-8?B?aHhrdE13WmpWR0IwSzVvUGhrTTRKcGpTMVJOZHI4Znp1andpQlk2VWpGbUdu?=
 =?utf-8?B?aEd5UjZmZURieWFYWCt6dGI1dEtlaWVqSEFtWUNqRllldlNJSURmSGI5eklO?=
 =?utf-8?B?dzFzbFR1OHpNS243cG1xZzVpOExNRGIwY21OUWZKVmQ5bDdncXJwdVQ5dDdT?=
 =?utf-8?B?Y2I4N1UzcW9POEZ1eWtQZUZma3dxZE5WTDBQYjV6K0J6R2JwbGh1UCtsWXZv?=
 =?utf-8?B?TzdidjZUM3VpbUladngybmZsNjl0ZjJveHVkaGtWYmgwZVpRcWZ4YmhtOHV4?=
 =?utf-8?B?QzdGZWdkcGg1VG4xVCt0SFNBYjltUXVPTVNhcUszK1ozak5tbXhEMi9JSkRo?=
 =?utf-8?B?bGIvNThVOUtkbXllWGZUZTkxTlNlemlUZkh4Q3lTYkR1d0pYMHBEL0FxNlVL?=
 =?utf-8?B?SjR1Q2VXSHlwbldXN05EdVdtY0daMzl3WHF2cUtobEtVRVF5ZGdXWnlvQm5C?=
 =?utf-8?B?UTNuL0NaY1dCcEMvN3B5QWhGVUFuZWdvcUN1TGpkL0FpNWhrcklGSlR3SDVO?=
 =?utf-8?B?VmpQdWowQWpIbXRCMW0rRW9WRW53QmtucWp0eGk3SDN1eVlJZXM1VzB6NWJS?=
 =?utf-8?B?T3hyWWdPVUxCVzBmOG1OZnBjSG9uczBkZkcweUFlYkNKZ2NPeTc0YTZoaERG?=
 =?utf-8?B?WDFPekw4SGZIdllLdWdXSVBpUnJOWVR3L3Z0MUlEVGV6emwvN3hlU1hPVmt1?=
 =?utf-8?B?enk4ZTA2alpIbFZTaUY4dXhnU08yWjdYdGVFbCsyV2Q1L2NqeVJBMjc1SkZv?=
 =?utf-8?B?ejhXNmxFZzI0SW9RRkxWbHJtUzhlTVBEd1p1MFZCb0IwM3pmOUdnVkhjaEpx?=
 =?utf-8?B?WnhQc1Y1bmdhZ0pxWDV2OWUzSURON1g2clc5Tkg5Z3ZJdi8vWE52NW0zMkpU?=
 =?utf-8?B?dlllZVhYbitLajk2MHhWU2J0ajhnVHRVZnRaTHl6UnZUM0VFMzBmWkpYWG9N?=
 =?utf-8?B?d05GS1phYzRRZ2dGWmRWbEhnTTlMT2R4TXFtamFTZWRHaTRsSzU0aXM2bTNS?=
 =?utf-8?B?R3hhSG9pUkQwTmxGcGJFNUlVZ3dnM09ML3NuOHQ1cTJ0am1FYVJyZDVEUFdL?=
 =?utf-8?B?VTZIM0xRWjJaNkZQZEVrZ0FULzZzdnlPT0JLYUFTTXltNmpNWGppOHcwbi9P?=
 =?utf-8?B?Q1RXM2V4bkl5d3FKM0pidGlMa1pqNGpId3dCbkdISEhPT3dKUGFQV1lObm9F?=
 =?utf-8?B?cWFmNVdmcmZ2d0pMeEJsM0h2TXpHNGUzTjV1N1V6ZlJsdm41L1NCeThGVXBP?=
 =?utf-8?B?UG5tc1JEZTcydExSTTNpL0l2cCtkb3RJa2VzbllIckZuVlBwSWJwZFV6eVJs?=
 =?utf-8?B?cE82ME1aamJZMUl1akxmVTRFZmttYXRUemtESzBYaGVqRCsrRmZJMFhJdTRp?=
 =?utf-8?B?NVBYZU5TaWxubEpNTlpJMXdONFdyQ2tEZHk3bFdwQjJxcks5WTJhamRlZmo3?=
 =?utf-8?B?QzlFWVo0aHFZWkloNG5WUWFrTFpMWFlLc3NINUZqQXVTUUx4c283YzlULzZN?=
 =?utf-8?B?dVR6QlM4RnJVZ1c4K1ZxT01jUS9EWENGUzVqOFp3N2lvRFV1OEUzZFZVeFJK?=
 =?utf-8?B?ME8vWldVTlAyRExOY0c2Z0EwYWZzZ0o4T1QwSDU1STQ1VWUzcFU3YU9QN0Nq?=
 =?utf-8?B?RmFyN3Q1bHM1M2VjNkFJWlVBdHUvZ2dqMmVqb0oxd1phK2JIUG9PTE9LWjMv?=
 =?utf-8?B?My9CK2pJL1BVaVZCbTNsWSs3ODRhSllYR21sYnA5MG9RL1JmaERlUVF4NnZh?=
 =?utf-8?Q?LsMUI82GZ5CoacVbrI4QyVA=3D?=
X-OriginatorOrg: amperemail.onmicrosoft.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe241e1-7d14-4e70-aaf4-08dcd8bc1738
X-MS-Exchange-CrossTenant-AuthSource: BL3PR01MB7057.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:02:33.8398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G7ZFRPOnOmD3CNpVwna06cRNWQ5OG9ZR7y7xkGhxrUvC+PeV8Oj4pN+xCMLPQCF+a5KQ0VMJu9846H3SN7VgbDOamIM6o+XHyVIr2lbyADtwUfZXdqL4Ggfoxbda/e5N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR01MB7635
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
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Thang Nguyen <thang@os.amperecomputing.com>, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Khanh Pham <khpham@amperecomputing.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Open Source Submission <patches@amperecomputing.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>



On 19/09/2024 17:39, Krzysztof Kozlowski wrote:
> [EXTERNAL EMAIL NOTICE: This email originated from an external sender. Please be mindful of safe email handling and proprietary information protection practices.]
> 
> 
> On 19/09/2024 11:43, Chanh Nguyen wrote:
>>>> +properties:
>>>> +  compatible:
>>>> +    const: onnn,adt7462
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  resets:
>>>> +    maxItems: 1
>>>
>>> How would this work? 'resets' generally is used for on-chip devices and
>>> a reset controller. That doesn't exist at the board level. A standalone
>>> device typically uses a GPIO lines if there's a s/w controlled reset.
>>> That would be the 'reset-gpios' property.
>>>
>>
>> Thank Rob for your comments! The ADT7462 includes an active low reset
>> pin (Pin #14).
>>
>> I'll change 'resets' into the 'reset-gpios' property.
>>
>> The example in the binding will be
> 
> The question how did it work in the first place is still valid... I
> think we might benefit from asking people to post their upstreamed DTS.
> Otherwise we will take broken or half-baked bindings, because we never
> saw the bigger picture. :(
> 

Thank Krzysztof,

I saw the ADT7462 includes an active low reset pin (Pin #14) to reset 
device via I/O pin. So, I introduced a reset property follow the device 
datasheet.

But the adt7462 driver has not yet implemented this property. My 
platform also doesn't design this pin on board, so I don't need it at 
least now.

Anyway, I hope Rob, Guenter and Krzysztof can give me advice on whether 
I should add this property to the binding?

Thanks,
Chanh

> Best regards,
> Krzysztof
> 
