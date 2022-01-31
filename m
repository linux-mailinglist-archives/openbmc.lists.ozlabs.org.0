Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 908214A5255
	for <lists+openbmc@lfdr.de>; Mon, 31 Jan 2022 23:27:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnjPH2CLWz3Wtr
	for <lists+openbmc@lfdr.de>; Tue,  1 Feb 2022 09:27:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=Dmt0oMbF;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com
 (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com;
 envelope-from=prvs=003070eca2=matt.muggeridge2@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256
 header.s=pps0720 header.b=Dmt0oMbF; dkim-atps=neutral
X-Greylist: delayed 1180 seconds by postgrey-1.36 at boromir;
 Tue, 01 Feb 2022 08:21:23 AEDT
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com
 [148.163.147.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jngwg5F9lz2yJv
 for <openbmc@lists.ozlabs.org>; Tue,  1 Feb 2022 08:21:17 +1100 (AEDT)
Received: from pps.filterd (m0150242.ppops.net [127.0.0.1])
 by mx0a-002e3701.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20VIVw71022668;
 Mon, 31 Jan 2022 21:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=UIcMcHTEH9sGm7c1L79td4V5dkdeMNZkpbNH32BYhNg=;
 b=Dmt0oMbF05UmqVKpO54/NVyUhbiTRBXl0rHXzBTfp1IQiXaw+bLNl5NQ/SS49QKrgPHT
 OP9PKu2BpXxw7VpkHoXXLO+YD7MOMSse3kUs0SyQ0lTrvFvEq6lU50BtASSuxI4/GMqO
 uALz1uUBtY779H3QqZZGnjwg+gbxfyLyBeOsaNwp7WsNQ9azTBT/XDtyuH4c390lCjc3
 pleiWZsvc+PDrED9Rbk0pmrC+BPLT90A5pIbp7wYYX3AewGes50CsurvqHLUFn7ctzFq
 1Zx8ZBH7hp8Ud7ttjscD3KyEN/QAhGwDWIEM6rG61IAgokz+KRPAIwocp8lLloGH5y1w sA== 
Received: from g4t3426.houston.hpe.com (g4t3426.houston.hpe.com
 [15.241.140.75])
 by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3dxjt526v7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 21:01:34 +0000
Received: from G9W8455.americas.hpqcorp.net (g9w8455.houston.hp.com
 [16.216.161.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by g4t3426.houston.hpe.com (Postfix) with ESMTPS id 565E05F;
 Mon, 31 Jan 2022 21:01:34 +0000 (UTC)
Received: from G9W8453.americas.hpqcorp.net (2002:10d8:a0d3::10d8:a0d3) by
 G9W8455.americas.hpqcorp.net (2002:10d8:a15e::10d8:a15e) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Mon, 31 Jan 2022 21:01:34 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (15.241.52.10) by
 G9W8453.americas.hpqcorp.net (16.216.160.211) with Microsoft SMTP
 Server
 (TLS) id 15.0.1497.23 via Frontend Transport; Mon, 31 Jan 2022 21:01:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSMA4AnDCHovuZjvimk7nBZ1S/zx3XgyBWZd0drDxLtfUFrjvGIZuoUzf2K92TOjIygVAB0XzYWunMtb+j5LfZrrp4+RAuH9FNtEBV2nLuGy9XlCtyXjzjL4r+JRVmpqHVmy2glHbr8U5OeIIQV439y8n0i5I7OSXo/eVbUWtEwpw/cHHfYKRzxGBXg/MHp9cWghk0HnsP91yj3Nu4nbsFMswG/F1UVB4x6r+bCWY0awYTV3yuPk3xmSX78QikOqkRuMqp4iG4ANug8B7rk2iVr8KFhNupN4i5eaBktMUWZmKBEZjrAS813lvou8jxZqPK05SFOmcH7HZlagSFoHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIcMcHTEH9sGm7c1L79td4V5dkdeMNZkpbNH32BYhNg=;
 b=mAvJoWB5pCUF/DJ0u5OTydHPy4ayfUHsYJMyj2OTdHg9kF8GLGxaNSXvMS9CTexPoCeNR2K46f6TwC/tWBqc0UkqgZ+2EpZcJFgdPf3pmX6RsK0cf9BFH/GSzgnR+RkCw4AWVx5NAMtEu3fRl15XasbCPZOb9KqgtDXw2mlFnaWUoH271HvZQCEnQ1QBatK6dJzq84Wh0rJkz5tetPDG1DSHVxsdvLBv2GEtcuw2FdDjAUL6pYpfKyB/cXtSyb1KcU8sF1wEy1f+03DQ0P9nhzMMXNP0l+iv0D7rpGrShuPDH6aLRiu/N7XNesv6iYv0exhQdJjJ3GHXfuUVWKok9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::15) by
 PH7PR84MB1583.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:152::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.22; Mon, 31 Jan 2022 21:01:32 +0000
Received: from DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4]) by DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::85e9:f9c7:b56f:cdb4%4]) with mapi id 15.20.4930.022; Mon, 31 Jan 2022
 21:01:31 +0000
From: "Muggeridge, Matt" <matt.muggeridge2@hpe.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: RE: OpenBMC v2.10/Hardknott status please
Thread-Topic: OpenBMC v2.10/Hardknott status please
Thread-Index: AdgWXbcymuo4TS1MSrmNNiFwvQzB+QAUvz0AAAo9HJA=
Date: Mon, 31 Jan 2022 21:01:31 +0000
Message-ID: <DM4PR84MB1855BB4EEAB345B6A0FDB8E2D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
References: <DM4PR84MB1855478F75965FD5275971E6D8259@DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM>
 <Yff1OKHtWj+xN7HN@heinlein>
In-Reply-To: <Yff1OKHtWj+xN7HN@heinlein>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0215b400-13e5-424c-c321-08d9e4fcdbc3
x-ms-traffictypediagnostic: PH7PR84MB1583:EE_
x-microsoft-antispam-prvs: <PH7PR84MB15830DFDE352E1113A5CB91AD8259@PH7PR84MB1583.NAMPRD84.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lCU9mL19AyYVJGbtHXbYYjAxVSSJQRY5qNVYKe3DLavMhDrhZsMaDdvmi+gkEzkcbvEDwV9nVkyCB5kF6wkVM09zD0h3ps7bUIVBKkBRpN9Mg+zARskCZ6sp6Kv46dDDWz7VvtUfrZzEm4ZhamYULUPDr9bC7mitjcR+fleMrhpCH4rp0KxNbHFYtP7RDDIvB5OTOnJsDyU2vP3d9HXUVdU7wJOH7POeLvPprzMyYk/zBEjwYVgZT8AOz3ZcYYTck/3ZEkvsbkgDMGuG8lBV99wOgvC+Voh1YD5M1WCws7Ez7A7p4/B1NOJU74YdUwcaAgp6lExb6OfrnbEjumNcWm+96UNYUhvfxWQK8NqCp/yjaCmOlWyRdoL6RweqPBz3myo8LdmGamkOLZUgAuCc/bQVE+WIKdCRx9c6m4oJrcV5G3m5O7StdZjaatrMLhqjQDZkaOHucoZVl8CCRN2c2kyd8CaMhKBv9pXelpmpyKCV31A//StTyha79AfbZEhZp1luYmFT1ITK/FeXVavG/lOFKHn6OWYLrND4cIES+CssJetkd+Rp7Owpi3UVO/3cno441bW5vRkTnsgEqjqyRXjEj7XHn2+2rkmwI97rOWLMPB/xbU63mmQ18sHv0Hy6XDa8YFUwBJfrliK8hTiuF/F4HHH4anTwzHHeKArZBIxw5txvEmUfUhvmx5bSDfXJw9f/YElaEM0HQh/SS/Tzw9BHNwiXdX4wukkT2a3YEji7exr+ANYh1BWywUvd7a4ablWKbUH2No6b/hXwHiYPaXvk8jtxQEX41odidzb/L1zETxAkSHhFr9/QvzPDMLIrpmiCSxNDha/0lMYrObx1gQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(64756008)(66446008)(8936002)(8676002)(66476007)(76116006)(66946007)(66556008)(4326008)(38100700002)(55016003)(82960400001)(122000001)(83380400001)(5660300002)(2906002)(38070700005)(53546011)(7696005)(86362001)(9686003)(6506007)(52536014)(6916009)(33656002)(508600001)(186003)(71200400001)(316002)(20210929001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?amdrRG5KRy9yanhycFJhMFlKVEVSTkcxdFJxYzJYTjhkbEowMmEwRUpiclFZ?=
 =?utf-8?B?Zkxxd3JtVjBwU3pPMGxnSDYzcll0SERkektPYkpyS3ZpUHJNcjdQVXBQM2xh?=
 =?utf-8?B?bE83bFNiK0lpUDRXbXFYeld1dzk1c1QwZWlVemk1M1dNbDhqQWF1Q2VkbU50?=
 =?utf-8?B?Q0hHZHp4MDRCRzJwd1AveFFrRVN4MForTXJKajFOSEtlWm1YdWpkN1RVNDR1?=
 =?utf-8?B?MTBHZEJEeHE2WERDeFpzQUhxMG5UTmtIVU9well3ajRYNndTRWhEdUt5eCta?=
 =?utf-8?B?Uk50SWpjZWVLakk0amliQjRaZmZiVFM3aG1VejdqY0t3WHBqOXhXbUxKY1VF?=
 =?utf-8?B?Ujl5c041dEdTQmVmWFN0aXZhZENoMmQ1S0xiZFBHVlJiUllodnpocVJzZzFs?=
 =?utf-8?B?TG5GMkh4bVkzTkxJWlVsazhuZDQydGQ2Uit2NjdVaC9lSE91Vi9wTUJBRUdM?=
 =?utf-8?B?MlA5UUJJSktuY1NDcWlpL1A1aWtmWXZPMkVsTWhYZTlmYmpDdGhaYU80eDF3?=
 =?utf-8?B?cE9KRE96cTE3OVYvcDlrWjE3eml4NXBGUzh1aGEwUE0xZ3c2d0ZLbnRYTjdo?=
 =?utf-8?B?OUxONWNUYzY3U0EyZ1JEQmVyQkJqTWdsQVpSeU1BOEpTYTNicFU5dkdVdUd0?=
 =?utf-8?B?MVQrd3hrbEJITnhsR1NSc3grR25lRkkvaUk2SkVoTUJib3prSGd2S1NhRGFu?=
 =?utf-8?B?d01lRDk2QjFtc0pwSzBkWkd6enU0RFZaQjJoYStzaUVTZnV4SjNOTEVZOWNh?=
 =?utf-8?B?YWtMR0JWWVY2VmZmVkNOR0lTRGl0bi9FY0hjWmlORksvdmtxRkZRRUpCNk5E?=
 =?utf-8?B?OFpUT0puRkt4SS9uM2RrUklrZnZkTFJSR1BRdnl0VmFLZm0yRmZ2WnB2UVUy?=
 =?utf-8?B?TDUxMHBSa0FmNExWNDREMDBKd3VKalh5RGZGTzVyZEFOOGcwWGJKbWttem5H?=
 =?utf-8?B?OXZCKy9XYUVweUEzQUNzS25uckprdS9YSDFXcU5XaEUxYk5pbnFGTE9DSHNr?=
 =?utf-8?B?OGliOTZrdDFGbnk3c1BzU3gzbG9sQW40T0hmWVNjbEZiTHFIK0JQbnNxZzd4?=
 =?utf-8?B?ZEhrREtYbnJYaWx3V2RmOEIzT0NGcUh0enQxbXNuNThJM1hsL0crUU02MzBq?=
 =?utf-8?B?R04zS3p3ZVA1RExwVUFiK0syT2R0UjhHTFFic3MrSUNQenh0SjYrVS9qTUJH?=
 =?utf-8?B?bTZpeTlFeGozZXFLbGlnWEFCU2JSV1lOZWUrMFgwZ094SXVZY3JJT3h6VkU1?=
 =?utf-8?B?dGw2SDNhQ2wzWm91aHJ3dFJySXFxY1pTNXhjYm5nVU50Qkh5akpzbGV5YnBm?=
 =?utf-8?B?WG9oZVZBeXFCclFsWUIzNDJvWkFqSWtocUtVM0xxUGY5VjFGQmFFa1BTLzFD?=
 =?utf-8?B?Zm1Kd1ZjZXcyS2oxZUNHNStOUTBYMC9rR3A2N20rWlNmMVlQTXJYVGN0cHo0?=
 =?utf-8?B?TjY3VHRMaHJqVzFMMTVYNkNEYTNxS1dkRXhVODB4YkdpYWd0M0ZreDcwbXY1?=
 =?utf-8?B?QTVxTUJRR3RUZXJHb1d4VWZsVFRNbkx1YXppZ2EvSUFQS1cyb3FWbHAwOERF?=
 =?utf-8?B?U0RLTCtFZkZObW4vMFR0Mmd2QXlKNHNxTHdFUGpDN1F0bGM0YlEwZURwcFFI?=
 =?utf-8?B?ZlhybG5qR0dMQWUwcDc4RzZnZEREWFIxSGtaZU85VzdoZDRuRk1kUXQ0WXJi?=
 =?utf-8?B?UTNUcW8vUHAxVTlzWUhBUy94WE5MV1dFSHdPTEJrd0F5YWY0bURydUZRcGZv?=
 =?utf-8?B?eGM4WnVFR3RPT2s0dXdKeXg2SHhHRjd1WVM0cXhoczdvU01sb2YyTk9WV09w?=
 =?utf-8?B?NDRHRXlHMmVHNmNFdVBid0hYMEVzZE4xZUVjY0FCcFNXN0hoZGd2c1JzR1Vk?=
 =?utf-8?B?K2RkN1FKS041VkdCY2JNV25VSHVRTytRQW4xaTFGaDFOd0t4Yi9FdXFBdE9K?=
 =?utf-8?B?ako1Umt1bVdWN1JaMThMYm9QNlc2N0JxTXJMU1JPZm5qeWhTUGV2Y0IzL21o?=
 =?utf-8?B?VDJidkR4ZU4yQ0EzMmNOYWo3Z0cvWEV4Z1NTWEs5c0FHOWNqbDhqUFBrNUN4?=
 =?utf-8?B?NnRYbUxmSmdhMkFYV28yNzhocVRTWjBLRGd4SDhSM0NiRjFjc0Rkd3BQbSs2?=
 =?utf-8?B?cXpQaEMzdFFWM3RtWUtoRFRzOU1SSWQ4NktodExiWitjeU92ODd2VElGNXBO?=
 =?utf-8?B?QjM5YjAyMWxDS09YZnFBWFdSSmhCSlJ4a2NGdWZQU1lpRlAvbGxHWjRQQ2VH?=
 =?utf-8?B?VWlwWjNud0s0bC9BbnVONy9MZUQxWkw5b3o1bUZkMzdhZEM0clBjekVXaXBr?=
 =?utf-8?B?SmdJbm5WMEtPblFHcXkyZ0pGeE9GQkRxK1hRZWhqTHdXWUJUZEVaUT09?=
Content-Type: text/plain; charset="utf-8"
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR84MB1855.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0215b400-13e5-424c-c321-08d9e4fcdbc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2022 21:01:31.8160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2pCGmAqwc+zS3Rv2lGScYkYN5CHP3YCJ1SHNX59STsDuPqdOVDTNBXK3eEZBecRQu0ogB9MH3ik7K1beyJ1NJzeOi45nN66uilzDVXOZXhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR84MB1583
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: SiHlV2kj9ALwS1j_APwSz7X8hnZHDKoU
X-Proofpoint-ORIG-GUID: SiHlV2kj9ALwS1j_APwSz7X8hnZHDKoU
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=881
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310133
X-Mailman-Approved-At: Tue, 01 Feb 2022 09:25:55 +1100
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

VGhhbmtzIFBhdHJpY2suICBDb21tZW50cyBlbWJlZGRlZC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBQYXRyaWNrIFdpbGxpYW1zIDxwYXRyaWNrQHN0d2N4Lnh5ej4N
Cj4gU2VudDogVHVlc2RheSwgMSBGZWJydWFyeSAyMDIyIDEyOjQyIEFNDQo+IFRvOiBNdWdnZXJp
ZGdlLCBNYXR0IDxtYXR0Lm11Z2dlcmlkZ2UyQGhwZS5jb20+DQo+IENjOiBvcGVuYm1jQGxpc3Rz
Lm96bGFicy5vcmcNCj4gU3ViamVjdDogUmU6IE9wZW5CTUMgdjIuMTAvSGFyZGtub3R0IHN0YXR1
cyBwbGVhc2UNCj4gDQo+IE9uIE1vbiwgSmFuIDMxLCAyMDIyIGF0IDA0OjUwOjQwQU0gKzAwMDAs
IE11Z2dlcmlkZ2UsIE1hdHQgd3JvdGU6DQo+ID4gSGksDQo+ID4NCj4gPiBPcGVuQk1DIHYyLjEw
IGlzIGRlc2lyYWJsZSBiZWNhdXNlIGl0IGhhcyB0aGUgNS4xMCBrZXJuZWwsIHdpdGggYW4gTFRT
IG9mDQo+IERlYyAyMDI2LiBUaG91Z2gsIEkgbmVlZCBzb21lIGNsYXJpZmljYXRpb24sIHBsZWFz
ZS4NCj4gDQo+IFRoZSB2Mi4xMC1yYzEgdGFnIGlzIGFsc28gYmFzZWQgb24gWW9jdG8gSGFyZGtu
b3R0IHdoaWNoIGlzIEVPTCBpbiBNYXJjaCAyMDIyLg0KPiBUbyBtZSwgdGhpcyBpcyBmYXIgbW9y
ZSBpbXBvcnRhbnQgdGhhbiB0aGUga2VybmVsIEVPTCBmb3IgNS4xNSBiZWluZyBpbiBPY3RvYmVy
DQo+IDIwMjMuDQo+DQoNCkkgYWdyZWUgYSBsb25nZXIgTFRTIGZvciB0aGUgNS4xNSBrZXJuZWwg
d291bGQgYmUgbmVlZGVkIGJlZm9yZSBpdCBiZWNvbWVzIGF0dHJhY3RpdmUuDQoNCkEgY291cGxl
IG9mIHBvaW50cyB0byBjbGFyaWZ5Li4uDQoNCi0gSGlzdG9yaWNhbGx5LCB0aGUga2VybmVsIEVP
TCBpcyBldmlkZW50bHkgcmV2aWV3ZWQgaW4gRmViL01hciB0aW1lZnJhbWUuIEFzIGhhcyBoYXBw
ZW5lZCBiZWZvcmUsIGl0IGlzIGluaXRpYWxseSBhbm5vdW5jZWQgd2l0aCBhIDJ5ciBFT0wgYW5k
IGlmIHRoZXJlIGlzIHN1ZmZpY2llbnQgc3VwcG9ydCBmcm9tIG90aGVyIGNvbXBhbmllcywgdGhl
biBpdCBpcyBleHRlbmRlZCBieSBhbm90aGVyIDR5cnMsIGZvciBhIHRvdGFsIG9mIDZ5cnMuIEdp
dmVuIGl0J3MgRmViIG5vdyAoYXQgbGVhc3QgaXQgaXMgaGVyZSDwn5iKKSwgSSBndWVzcyB3ZSB3
aWxsIGtub3cgc29vbiBpZiA1LjE1IEVPTCB3aWxsIGJlIGV4dGVuZGVkIG91dCB0byAyMDI3Lg0K
DQotIFRoZSA1LjE1IGtlcm5lbCBpcyBpbiBPcGVuQk1DL21hc3Rlciwgd2hpY2ggSSBndWVzcyB3
aWxsIGJlIGJyYW5jaGVkIGFzIGtpcmtzdG9uZSBzb21ldGltZSBmcm9tIEp1bmUgKGJhc2VkIG9u
IGhpc3RvcmljYWxseSBPcGVuQk1DIHJlbGVhc2VzIGJyYW5jaCB+M21vIGFmdGVyIFlvY3RvIHJl
bGVhc2UpLiBBdCB0aGlzIHBvaW50IGluIHRpbWUsIHRoZSBtb3JlIGludGVyZXN0aW5nIHJlbGVh
c2UgaXMgT3BlbkJNQyAyLjEwLXJjL2hhcmRrbm90dCB3aGljaCBoYXMgdGhlIExpbnV4IGtlcm5l
bCA1LjEwIHdpdGggYW4gTFRTIHRpbGwgRGVjIDIwMjYuICBUaGVyZWZvcmUsIEkgYmVjYW1lIGlu
dGVyZXN0ZWQgaW4gdGhlIDIuMTAgcmVsZWFzZSwgd2hpY2ggeW91IGhhdmUgaGVscGVkIGNsYXJp
ZnkgZm9yIG1lLg0KDQo+ID4gSSBzZWUgYSBmZXcgcGllY2VzIG9mIGluZm9ybWF0aW9uIHRoYXQg
Y2F1c2UgbWUgdG8gcXVlc3Rpb24gaWYgdGhlcmUgd2lsbCBiZSBhbg0KPiBPcGVuQk1DIDIuMTAg
cmVsZWFzZS4NCj4gDQo+IFRoZSB2Mi4xMC1yYzEgdGFnIHdhcyBtYWRlIGJhY2sgaW4gTWF5IGFu
ZCBub2JvZHkgc2VlbWVkIHRvIGNhcmUgZW5vdWdoDQo+IHRvIHB1c2ggZm9yIGEgZm9ybWFsIHJl
bGVhc2UgdG8gYmUgZG9uZS4gIEkgZG9uJ3QgZXhwZWN0IHRoaXMgdG8gYmUgZG9uZSBub3cuDQo+
IA0KPiA+IEluIGEgbWVzc2FnZSBmcm9tIFBhdHJpY2sgV2lsbGlhbXMgKGFwcGVuZGVkKSBoZSBz
dGF0ZXMgMi45IHdhcyB0aGUgbGFzdA0KPiByZWxlYXNlIGFuZCB0aGUgcGxhbiBpcyB0byB0YXJn
ZXQgSmFudWFyeSAxNHRoLCAyMDIyIGZvciBhIDIuMTEgcmVsZWFzZS4gV2hhdA0KPiBhYm91dCAy
LjEwPw0KPiA+DQo+ID4gTWVhbndoaWxlLCBhdCB0aGUgdGltZSBvZiB0aGlzIG1lc3NhZ2UsIHRo
ZXJlIGFyZSBubyByZWxlYXNlDQo+IG5vdGVzPGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuYm1jL2Rv
Y3MvYmxvYi9tYXN0ZXIvcmVsZWFzZS9yZWxlYXNlLQ0KPiBub3Rlcy5tZD4gcmVwb3J0ZWQgZm9y
IDIuMTAuICBUaG91Z2gsIHRoZSBDdXJyZW50IFJlbGVhc2UNCj4gQ29udGVudDxodHRwczovL2dp
dGh1Yi5jb20vb3BlbmJtYy9vcGVuYm1jL3dpa2kvQ3VycmVudC1SZWxlYXNlLQ0KPiBDb250ZW50
L2I4OTM0YjEzODI0MDlmZGVjZjk5NmZlZDZjNTYzMzllNzY3MTdmMmM+IHN1Z2dlc3RzIDIuMTAg
aGFzDQo+IGJlZW4gcmVsZWFzZWQuICBJZiBzbywgd2hlbiB3YXMgaXQgcmVsZWFzZWQ/DQo+ID4N
Cj4gPiBDYW4gc29tZW9uZSBjbGFyaWZ5IHRoZSBzdGF0dXMgb2YgdjIuMTA/DQo+IA0KPiBUaGVy
ZSBkb24ndCBzZWVtIHRvIGJlIGFueW9uZSB2b2NhbGx5IGludGVyZXN0ZWQgaW4gYW55IHJlbGVh
c2VzLiAgSSBtZW50aW9uZWQNCj4gaHlwb3RoZXRpY2FsbHkgbWFraW5nIGEgcmVsZWFzZSBmb3Ig
djIuMTEgYW5kIG5vYm9keSByZXNwb25kZWQuICBJIHRoaW5rIHRoZXJlDQo+IHdhcyBhIHNpbXBs
ZSByZWdyZXNzaW9uIHRlc3QgcmFuIG9uIFdpdGhlcnNwb29uIGJ1dCBiZXlvbmQgdGhhdCB3ZSBo
YXZlIG5vDQo+IGluZm9ybWF0aW9uIG9uIHRoZSBzdGFiaWxpdHkgb2YgdGhhdCBicmFuY2guDQo+
IA0KPiBBcyBiZXN0IEkgY2FuIHRlbGwsIG1vc3QgY29tcGFuaWVzIHRoYXQgYXJlIGFjdGl2ZSBp
biB0aGUgZGV2ZWxvcG1lbnQgZWl0aGVyDQo+IHdvcmsgb2ZmIGBtYXN0ZXJgIG9yIGhhdmUgdGhl
aXIgb3duIGludGVybmFsIHJlbGVhc2UgcHJvY2Vzcy4gIEkga2VlcCBoZWFyaW5nDQo+IHNtYWxs
IGNvbW1lbnRzIGhlcmUgYW5kIHRoZXJlIG9uIERpc2NvcmQgbGlrZSAiSSdtIGJ1aWxkaW5nIGEg
bWFjaGluZSBiYXNlZA0KPiBvbiB2eC55IiBidXQgSSBoYXZlIG5vIGlkZWEgd2h5IHRoZXkgY2hv
c2UgInZ4LnkiIGFuZCBxdWl0ZSBvZnRlbiB0aGV5J3JlIG9ubHkNCj4gYXNraW5nIGJlY2F1c2Ug
dGhleSByYW4gaW50byBhIGJ1ZyB0aGF0IGhhcyBhbHJlYWR5IGJlZW4gZml4ZWQgb24gYG1hc3Rl
cmAuDQo+IA0KPiBJZiB0aGVyZSByZWFsbHkgYXJlIHBlb3BsZSB0aGF0IGFyZSBpbnRlcmVzdGVk
IGluIHVzIG1ha2luZyBmb3JtYWwgcmVsZWFzZXMsIHdlDQo+IG5lZWQgcGVvcGxlIHRvIGV4cHJl
c3MgYSByZWFsIGludGVyZXN0IGFuZCBjb250cmlidXRlIChhdCBhIG1pbmltdW0pIHNvbWUNCj4g
dGVzdGluZyB0byB0aGUgcmVsZWFzZS1jYW5kaWRhdGUgYnJhbmNoZXMuDQo+IA0KPiAtLQ0KPiBQ
YXRyaWNrIFdpbGxpYW1zDQo=
