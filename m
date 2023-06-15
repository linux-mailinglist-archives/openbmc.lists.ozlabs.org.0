Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD0B73143C
	for <lists+openbmc@lfdr.de>; Thu, 15 Jun 2023 11:41:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=jRz5ohRk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhckT45Nfz30h9
	for <lists+openbmc@lfdr.de>; Thu, 15 Jun 2023 19:41:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tcs.com header.i=@tcs.com header.a=rsa-sha256 header.s=default2048 header.b=jRz5ohRk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tcs.com (client-ip=219.64.33.120; helo=inmumg03.tcs.com; envelope-from=prvs=523ef264b=sandeep.pkumar@tcs.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Thu, 15 Jun 2023 19:41:02 AEST
Received: from inmumg03.tcs.com (inmumg03.tcs.com [219.64.33.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhcjp1X9tz306p
	for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2023 19:41:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tcs.com; i=@tcs.com; q=dns/txt; s=default2048;
  t=1686822062; x=1718358062;
  h=from:to:subject:date:message-id:mime-version;
  bh=myecjfBUPzJ9sfRW/VcYhmEIgZ06RyKKMjEfZ2oPqe8=;
  b=jRz5ohRkQ91mKjXP+TbJA2IVAjMO6A9AFTKE6Btd3fzNsFrihy/EMEkX
   WJdVexwotkhj+SQXnzuzPdgp3xfkCXxGjy+uuizVbKLI+5m/bS9mJxyZE
   yEckhxwozPKSugh/E71FHce7Qq5s87rec/Kij+Bt/fZc59fsALWh1w9+l
   +oCtK/ZvFc23szmqErAzgfc/WebyKH+Fnm+JfbHsYpgFMwKRwfiNtVh1O
   7jOt3NYyVenddUlvBIoWu5PYwzjfFqciX6l8Jbtw81o8gkf9tarXQruL9
   7bI6CIjbCw2i7my2QbRsYbaSIa+wN16w6JOdFPFGAv2LyD7F0Tljn8YkR
   g==;
X-IPAS-Result: =?us-ascii?q?A2BNBgD32opk/2AKEaxagQkJgnKBA3MCt24PAQEBAQEBA?=
 =?us-ascii?q?QEBBwEBRAQBAYQFgQEChXwmOBMBAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QYEAYEchS86DII3IoNfXgEVayYBBBuCd4IVR616AQEBdoE0gQGCFASdSIFog?=
 =?us-ascii?q?UKJOINgFYQzgk+BWII3gkKCc4QSgi4EjiqPbmWBKG+BHoEifwIJAhFngQgIX?=
 =?us-ascii?q?IFwQAINVQsLY4EcglQCAhE8FVJ5HQMHA4EFEC8HBDIoBgkYLyUGUQctJAkTF?=
 =?us-ascii?q?UEEg1gKgQw/FQ4RglpjQRtZfAc2A0QdQAMLGyE0PTUUHwUEgkFwgQxInxyDf?=
 =?us-ascii?q?z5ElRGdGZRSB4QLBYFYn1kXqVeHX5A4IKduAgQCBAUCDgiBelCBLjMaI4M4U?=
 =?us-ascii?q?Y5TF5NLgTACBwsBAQMJimpeAQE?=
IronPort-PHdr: A9a23:hNf40xVP9KZ5Qy8D3q8TunE1cSHV8KxlVTF92vMcY1JmTK2v8tzYM
 VDF4r011RmVB9idt6gewLOO+4nbGkU+or+5+EgYd5JNUxJXwe43pCcHRPC/NEvgMfTxZDY7F
 skRHHVs/nW8LFQHUJ2mPw6arXK99yMdFQviPgRpOOv1BpTSj8Oq3Oyu5pHfeQpFiCS9bL9oI
 xi6sxvdusYLjYd+N6081gbHrnxUdutZwm9lOUidlAvm6Meq+55j/SVQu/Y/+MNFTK73Yac2Q
 6FGATo/K2w669HluhfFTQuU+3sTSX4WnQZSAwjE9x71QJH8uTbnu+Vn2SmaOcr2Ta0oWTmn8
 qxmRgPkhDsBOjUk9mzcl85+g79BoB+5pxJx3ZPaYJ2bOvR9YqzScsgXSnBdUspNTSFNHp+wY
 5UJAuEcPehYtY79p14WoBWjHwasAv7gxSFWiX/uwKY01vkhEQTc0ww6AtkDt2/Uo8/zNKgPT
 ++60rHIwS/bb/NVxDf97ZLHcgo6rPGQQb1watDdxlUoFwPAl1idr5HuMDyJ2OoXqWeb8/ZgW
 vy1i24hswx8rTyiy8Uih4TKiY8Yyk3J+Tt4zYsoJdC0VU92bcOqHpZeqS2XNIR4T8MhTmxmt
 ys3zqELtJ25cSYKy5kq2QLTZvqaeIaL+hLuTPudLDVmiH5/Zb6yhQy+/VW8xuHmUsS50U5Go
 jREn9XQuH0A0gHf5tSDR/Z8+0quwyqD2x3W5+1ZPUw5kK/WJpwnz7UtjJQcq17DETXzmEjui
 a+WcVgr9faw5uT8Z7XmuoecN4hpigHiKqgumtKwAeA/MgUWQWWV9/qx2qPt80P/WrtEieM4n
 7XWvZzCJMQboLC2AxNN34o+6RuzES2q3MkakHUdMV5JZAiLgozoNl3WJfD3F/a/g1CikDdxw
 PDGO6XsAo7XIXjFjbjuY6hy61ZGxAorztBf+pdUBasbIP/oRk/+qMfYAgUlPAyzxubrENN92
 ZgGVmKVHqCZKL/SsUOP5u83PuWAfJUVtyrlK/g5+/7uimc0mVgFfaa325sYc3W4Eeh9LkWdY
 HrsmcsBEXwQsgo5Te3qjEeNXiVIZ3qoWKI8/D47W8qaCtKJQZighraE1w+/H4ZKfSZBGFSFG
 2yucJ+LEb9YbzqfJMVkmRQAVKO9UMkmxxWnvhS8zKBoeLn64Cod4Knq0tR46vWbtgw3/CY8W
 9+U1W2AQnkyhmAVQjYs9Lx0ugp2zVLVgvswuOBRCdEGv6ABaQw9L5OJl4SSQ/j+WQPEK9GOT
 lvuAtCrGio4Qd95xdgSK118FNOvglGmvWKqDrYZmqbNCMky9aTRjHT0Ltx2nnDB0qRphlI6Q
 8xJYGuhgKM39wXaC4PT1UuDkKP/aa8HmiXK8TTr8A==
IronPort-Data: A9a23:w+RSrqB3mdQraRVW/7jhw5YqxClBgxIJ4kV8jS/XYbTApGsrgjEHx
 mEaCj2Eb63eNzCnKo90O4SyoENQuMWHytY3S1Rr/nsxFCsU8ZTLWtjFdR+pby3OfsfPQU5rs
 Z1OMIXpIZFvRBcwhPsN3psND5VY/fvVLlYpILecYkidfSc9FGF5z0gLd9cR2uaEu/Dga++2k
 Y20+5W31GONgWYuaTpKsv/b8XuDgdyr0N8mlg1mDRx0lAKG/5UlJMp3yXaZchMU6qENdgKLb
 76rIIORpws1zD9xYj+RqYsXR2VRKlLk0apivVINM0SqqkAqSiXfSc/XPtJEAatco23hc9ycV
 LyhuLToITrFMJEgl8wafwhXLDBQEJdM+Z7JByeBoZSv0kf/Ji6EL/VGVCnaPKUz1s1LLUV20
 MAxdFjhbDja2Ljwme39E7Eq15pLwMrDZevzvll7xDfVAPs+B4jAXqDD//dE1yx2jcdLdRrbT
 5tENmI+MUqYOHWjPH8cMLcdkuqWhkPidiZyrEulupQ+4DPqmVkZPL/FdYC9lsaxbcJNk0CSo
 2nu+2XiHgpcM86bwDCetHW2iYfycTjTAd1IUuTnsKcyxgzNroAONCAruZKAiaHRoiaDtxh3c
 ST4JgJGQXAOyXGW
IronPort-HdrOrdr: A9a23:dzj02a7R8KGvtJlkygPXweeCI+orL9Y04lQ7vn2ZFiY0TiXIra
 GTdaoguyMc0AxhIk3I6urwRZVoIEmsv6KdjrNhRYtKMDOW3VdAT7sSoLcKoQeQYBEWn9Q1vc
 wLHsQQeb6Ab2SS5vyKhzVQZuxQueVvh5rY49s2oU0dKT1CWuVF1UNUGwybGkp5SE1vAoc4Lo
 OV4o5qtietYnMea+W8Hz0gU/LYr9PGuZr6aVpebiRXpzWmvHeN0vrXAhKY1hARX3dmxqojy3
 HMl0jU97iuqPayzz7bziv2445NkNXs59NfDIini9QTKB/rlgG0Db4RF4GqjXQQmqWC+VwqmN
 7Dr1MLJMJo8U7ceWmzvF/ExxTg+CxG0Q6t9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOisYZNBx+oplW92zGIbWArqqOHmwthrQchtQ0bbWLYUs4UkWUrxjIXLH7HJlO81GloKp
 gpMCiW3ocrTbrTVQGngoAo+q38Ypz4di32G3TreaSuomBrdAoS9TpD+CRF9E1wqa7UD/J/lr
 r52mEBrsAUcifTBZgNWNvohqOMezPwqFv3QROvyViLLtB4B1vd75Hw+7k7/+esZdgBy4Yzgo
 3IVBdCuXc1YF+GM7zG4HRnyGG7fIyGZ0Wa9uhOo5xi/rHsTrviNiOODFgojsu7uv0aRsnWQe
 y6Np5aC+LqaTKGI/cD4yTuH51JbXUOWswcvdg2H1qIv8LQM4Xv8ujWauzaKrbhGSstHmn/Hn
 wAVj7uI9go1DHiZlboxBzKH3/9cE32+px9VKDc4ugI0YAIcpZBtwAE4G7Jkv1j6Qcyx5DeUH
 EOUo8PyJnL1VVe1Vy4nFlUBg==
X-Talos-CUID: =?us-ascii?q?9a23=3AsfPQQWktr0Ib3E9BaF8Tv/DkeqLXOXrx3XjvMmG?=
 =?us-ascii?q?VM2xoabOzFmGAoJ95mfM7zg=3D=3D?=
X-Talos-MUID: 9a23:vuI/bgQcW3DA26beRXTnvBRBOspW456zDVsnlYw2pPeNNndJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.00,244,1681151400"; 
   d="scan'208,217";a="957095603"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwLwUJmkb4fB6P3tS8iuDmz6dziF5JiFeMPgp+tBN/UkwHyN7LlGFbQlX6DdOslS3GuGXnzEmEagevRP27aJOVJy7VLQTmawMcAqqkwt1wk3O6KEMj93VxdbxquIEW72QKo7DIP+HcChtjThjZW/HrqXiZ4io/mF3CSbwSkOqwFQgnKXUjb1bMQPpH6/VCa4dIUsjH2/kI3UojRwm5mt8TnAg9NukOQvYhUYm3OpI+so8mpE5qi2sKH0MewG8dH9ViD+VOQTpqIqmo6R2JtLZmb7mTVYsogf9C8MDEaTGEYDhPA/jXVHA6t6PomHCkChUN6wllKeXk5nw/Qd4i9uwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FgwZ3xYZo3kLLs22ojnNRuWLUgql6ndFqEQrQhox90=;
 b=Q1mGArb+BNTYA2NzJI3btPke2OuziJ4I1wyfZLX1+5u/1SJNlRTKVP99FxJLt1zRgaziABzjamKPFDCzD3s4p2jNxYNaW4O82rT+6ab7NJ+jjq7jbJGdjv7ERhMWth8b+U/VFWOU3qjDqP9aGuRscbAukJssIXvaiO3q+QhgS3DRU+InWO1OIzEpMN1sT7aurVu7nCEEpm0yOq152GbyD2+fjzU0kWt3aYCBFQjvkSt0wdxxsqwwGHCQf0o5EaOVjxsu3/DxHNkr5SNemg29EQr5dxmizS7dFSaCaJ0vzZdpdeytAZb1q798ublAuMeEVSFjdgpNuLORlBFooLFQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=tcs.com; dmarc=pass action=none header.from=tcs.com; dkim=pass
 header.d=tcs.com; arc=none
From: Sandeep Kumar <sandeep.pkumar@tcs.com>
To: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>
Subject: Unable to get the TPM device with swtpm
Thread-Topic: Unable to get the TPM device with swtpm
Thread-Index: AdmfbBTlf6uUSLa2Taiw4iMoqE3IkA==
Date: Thu, 15 Jun 2023 09:39:43 +0000
Message-ID: <MA1PR01MB41291EE6564B664F91E3228F875BA@MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ActionId=4494a6cd-cc50-4736-a37e-88ebe2e132f8;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_ContentBits=0;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Enabled=true;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Method=Standard;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_Name=IRM_test_300622002_ul;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SetDate=2023-06-15T09:30:18Z;MSIP_Label_1aabfc0d-38d5-4801-9e82-1226fde31efa_SiteId=404b1967-6507-45ab-8a6d-7374a3f478be;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=tcs.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MA1PR01MB4129:EE_|PN3PR01MB7414:EE_
x-ms-office365-filtering-correlation-id: e1c03d05-6fd7-4cea-a9b3-08db6d8472ce
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lMBaWCcUhhbG8BqjycIo6H4qj6nVKzzTvRrXthmgCN082TPJoh0MoUNuG3TyuJaCzQNolgo1yvC7IlBWH2o2CQ0+okq0PhpSt8M6/gd1VgY4QKsIUGvZxT+my337S1clBXGtioCeJjeTYKDwailL7zbcwBOrX4Q4voVtJXucOmjKdM1uXk21UnRznHAYELZjHBSurSH7UIine2/TujonTOtvcPJEMJnY4GFZdYqKJxwvf2TLj595rfnl9/7eCHIUeRU/+Vlzuvs1ZkknZgW049GDto4t437PVpW6SKXjcIwaVvz/jj9YYJ1BAwHa+pEfPYlfSqc4MbLtJpRnd/oYvCyx89MiSEkCu4UkuXYSkakix8HlyZvikWKXEqQvWxLQqWPwvFRWqm1H3IgvdAHYQ1vw+VF9TgwazTharrw54jPc0ewIoyFnXeNiLgRsSfhnXi5W7CFyca2I49uaMKtEUIw2SxlXHYe8fJhEzRjUl3TFPqDhZ55h8BTeUV1OrF++9r2Yrt8GUViD7qt3ZplJ/eTALXGhjxaHF1IrEAYc2EkrrezYaRpFR9AkpQvwfqoTZFbPP4L7OPWzWI7dZ3xa0yQyJi9usigaiPnTvvh+bP6X/Bcd8+5PmD3wAnqmXGzxNRY0Kk9w/8b/adcMUHWJiD40TOAtJpKJ3lNwW5wM9WU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(136003)(396003)(346002)(451199021)(2906002)(9686003)(26005)(4744005)(186003)(55016003)(6916009)(66946007)(76116006)(66476007)(64756008)(66446008)(66556008)(71200400001)(82960400001)(41300700001)(7696005)(8936002)(8676002)(316002)(86362001)(33656002)(38100700002)(478600001)(122000001)(38070700005)(6506007)(52536014)(5660300002)(17423001)(15583001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?XWWy4XrJBRxgaf7hQcRFgnvWUsTnijPqqh9qPgD190hAu1ik7+d55LJ/ocwJ?=
 =?us-ascii?Q?JBF9vxhPNkdKFDWs64IQrPfBI5ZUK9n7GRyIpQSLv9LIW7VBaoftYlJolf/t?=
 =?us-ascii?Q?FTxR/87GWEygJNDHiSV27SKpF2CJEmbn9NW16VlELmKU5LLZ7IXyfqtl/fzC?=
 =?us-ascii?Q?heptF0VEtT5sEBPsHgYQ4Je2cwcH/JBrjkyoYkTvq4/FRGpOWmHxQ3T+ANzb?=
 =?us-ascii?Q?dQnAydy7rqpbCRtRiyJGOyrpmCZzBuYGwP5DI2CSXsZZlYSjgwi94AWTAIkh?=
 =?us-ascii?Q?hdh2FCTSqKrl/nj9KYtFYwWTvATLK8+vKXQxzGxrPcLwH6kE68U2zWR63Ny6?=
 =?us-ascii?Q?3HzppsgmY59IID13QO+jUTv4QAaXIvRcOqlcszeWLurdWIUylV+fazOQsLnj?=
 =?us-ascii?Q?OirhlASXC3lpZguQ/dbvwqvzlcGMij6226n8nnktQt0jys7S+PwPTkjmx10O?=
 =?us-ascii?Q?Qaky+5JgcYEZrFkIDSHSx2O3CwsjRDZSngOOU426UiFYd/F/oQrCzfU1wiXY?=
 =?us-ascii?Q?aJRcEqjoTwrRbnezLLsxkwHod68XrOxRKgBkCmBVAd/e0PEQmeIRLtuG/YeU?=
 =?us-ascii?Q?5+AzB4+5z4Ylpslf49m18D+SLN3PBWcP+SMeD5KySEZ97uYUNRubSl+NuKxt?=
 =?us-ascii?Q?mZD82ivj7xYrTvxFmt4CgafFcZMglvvj6LyNkwqmqiseE9dEuxWU00kbws1B?=
 =?us-ascii?Q?txbPGFtshXg6EoNUwfxyua+/pl+3YZLwnh0Mo2J+Uvz0HdcLEJtTZtplzDZ9?=
 =?us-ascii?Q?d8eepSHA9l/uJfFqPLg4bNOjcK2SY//l4fhvWIuD2OA28Igahk/fjAlU5grQ?=
 =?us-ascii?Q?b1tL374SW+2oUUKBsDMfqSpGgC+FdSUrn26pTD9KULwTDJEY/Wl7l4bDq/7J?=
 =?us-ascii?Q?/tG0cYnjdjkYfv7iCOI/x3JSPtf4uEwjyi0RsytlI98KabBvzqevsTM9acex?=
 =?us-ascii?Q?XKaMs16pAZ/lrDypSyEekgBwW/uTWS/JgPRdOG9RxAZOZLjJI3SrHfOK6+aV?=
 =?us-ascii?Q?Zb6+BM6pJIWwhJ6DivLJMkDz3GvHce2Az3uMSimTEVXFnOEc/BUpaoqAvr1X?=
 =?us-ascii?Q?ffB/gpGvA6zLQx2aXoCitkqmW5fNsH1V6weK2Dd0CqxopZXzyYnsOe4X6Saq?=
 =?us-ascii?Q?bTDdZz9oxGOwL++H/pWauVyh/PCHDMy3A01v+8+K+/989KkWXdIVytn7J6LK?=
 =?us-ascii?Q?StKr3Ia+NtlRzGUFpuEsiV5v2tXKBkD7ug8kbxmimqOgz034PAYpe59r2ADP?=
 =?us-ascii?Q?myRVTutTqPcG8UkYMG5qghVIz66zwVtxvMdGwnbt9JJFACi4mObcfyFDE7k1?=
 =?us-ascii?Q?s0zLu8/nXy7AE5Fct7OJvAA5G99qBs2FloDWaJEthEXvpT8HjH13or17G5gh?=
 =?us-ascii?Q?HgjBSSo6zTAB/SFP6UElzoqoB22fTNRu6yg7D9R6ZUrt4fugAXFqL4y46CPm?=
 =?us-ascii?Q?0/tw2qaRR6BTjp41ayIcGXfo5PnmITUzbxYgSVJ7KqIa94QD1ARX+Gp+QVDV?=
 =?us-ascii?Q?jJEl5YHRegFV2mvteYtQgjUpfS2B+QWXZr7R1XF4GzfaozkCp1kWDxCRaf/i?=
 =?us-ascii?Q?OzJM/vJrvTiMCy3n3VU=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB41291EE6564B664F91E3228F875BAMA1PR01MB4129INDP_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: BoRieAkTqV24DtCsRzLTX3ONRohvKCHp2HrUfzQvRNFLQCaKN9gtgtZObeQ2gRCqmHUaBtuX3dZyIvq9jTjTAIVfjGXceYkdxF2fiB63ayqqYA181+88qpAjKYYB8XOwbNw2WVybOSO0oq5WkTdNjWrOGWEa9KFmAo+1Ky7zb54BsvIHl9i4I7Gsqwt0Bw19m4M51zrzf6VX/zyqplY20jcGA56EmDz7/saR2ckgmH9nKPy5zoFDS/VCAJcP+K/Oa8pR9ay1t7r1+XNPw50dSYDzfyxA/gPtnK0fu1gb2CxDJqnnGj0YL+710J3e68PQK0CSKNqiUHjiIbvV0v3D1q51fwg+ac+bMKpPGeDX33uaKLiEJYe2PG2WmJhHENKkh/TQ2W2bfiQc2BwJgIk1P7RhK3ngd5R2iIFZSQd6m7s+fJHqRSSmVNLAtNCm0MfH5oz32P0DQnv8ZxuXEuDxU0aKjRLCxl3RxQYD01XfTItRzaCoxk5Mn7tkpjzwtvUbec6dZEFjWhP/U1iCy/SNt32JJJkAjdlJR/56+grW4PJoYt77jrfhGBCtf33Gm8Aad012ouX8DP9MWDmau87IyVoC/nWsg+aOW4BdZKq+P0FCHFrInnQMpEEBgJzRq28JUf4icPDhn+K8pCQRZQaEdarJ8FtAhbK5nupOwotUlS4ysj/znEWIJFMGKTYGiy4OKFRdPXvrHPq1nau//OY7EnEMKsdmHlxQ5ECd6nKzXwHE0gIom7Sts+pSRbOW7TW8O7+lcCrNeGRZRTJa6v7yr+8Lq3bA860YhDbPk+2VDNM=
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB4129.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e1c03d05-6fd7-4cea-a9b3-08db6d8472ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 09:39:43.2224
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 404b1967-6507-45ab-8a6d-7374a3f478be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vWFM7EEfLgHJ7co83bJkMHwNCiSjwdXLOb8gZWYM9LxIO89uCuNStEqd5pW0D6o7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7414
X-TM-AS-Product-Ver: SMEX-14.0.0.3092-9.0.1002-27686.007
X-TM-AS-Result: No-10--4.141300-8.000000
X-TMASE-MatchedRID: qixC7qzjERGMp9w0tjqOxTjNGpWCIvfTqqq9awALpxCUucejOoym7zdi
	1F/Kc0JX5uMU7oGSbz/+BLS8RA2xhnwzxAv8kID0jrVn4cme+w7BlPdI+u7Q6HQ8D+SLaQjs3rE
	8Oo7Zj65JJOsmoFihLOeJm6LClLmHOY0uFdPXUM78dMpK2wMYwl3n+beqvEXMSprpPKHJe884KP
	KQxy+E/gvBPGQoLW6lDWo1/vBF88U+KbeGe6bo/Ucp08JfWWIeVOLMRauooBF9eABRdMyrtEswg
	ej8gTmBJNe/yL58XWf0xDAHHSvE81x6jxiCF1xabApbcE5szFN9e88fgokls44fFueSeIindeqE
	rkVhgOkSW2ZMFgOR2KIrWbdPajZaHl1zFQ5GkXizRPQ8T4oe5cogYxpm9PTbOyxd6V963VS48Wu
	RFQVdauLzNWBegCW2PerMcoCGxRjQLWxBF9DMQSBuGJWwgxAra7leoU/OMhMfEuapaABz+GDtUe
	bB8hJUptkuZiP8yFEd78xRfEh915AmEJFXys/t/k+jJk1V8+vXHOLFtBYDTcbMhQXxle1IjFcKW
	BhE+Aky3TDSBBO/qFQ9+8FrViGsCM6iKZ0iZ9P3IIv3fxytfNfO9zpSRDWmlYIQG3ChHubQh3yJ
	URF7t4eHKXTTyoTNfpiOGOFkA7ygyjP6XP5ALg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.141300-8.000000
X-TMASE-Version: SMEX-14.0.0.3092-9.0.1002-27686.007
X-TM-SNTS-SMTP: 9E02D757A297B895E6FB394E9475885F656A0D12FA1B63EECDF177D68E1750612000:8
X-OriginatorOrg: TCS.COM
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

--_000_MA1PR01MB41291EE6564B664F91E3228F875BAMA1PR01MB4129INDP_
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TCS Confidential

Hi,

My current setup:

  1.  Running swtpm on ubuntu to act as a virtual tpm.
  2.  Enabled measured boot, tpm, hash on u-boot
  3.  Openbmc image loaded on qemu.

With this setup, I am trying to get the tpm device through tcg2_platform_ge=
t_tpm2(struct udevice **dev) from u-boot(image-fit.c) . But I am getting er=
ror 19 (ENODEV). Any Idea why it is not recognizing the virtual TPM running=
 on ubuntu?

Thanks,
Sandeep.


TCS Confidential
=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D
Notice: The information contained in this e-mail
message and/or attachments to it may contain =

confidential or privileged information. If you are =

not the intended recipient, any dissemination, use, =

review, distribution, printing or copying of the =

information contained in this e-mail message =

and/or attachments to it are strictly prohibited. If =

you have received this communication in error, =

please notify us by reply e-mail or telephone and =

immediately and permanently delete the message =

and any attachments. Thank you



--_000_MA1PR01MB41291EE6564B664F91E3228F875BAMA1PR01MB4129INDP_
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:274102178;
	mso-list-type:hybrid;
	mso-list-template-ids:-844306022 67698703 67698713 67698715 67698703 67698=
713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
TCS Confidential<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My current setup:<o:p></o:p></p>
<ol style=3D"margin-top:0in" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 =
lfo1">Running swtpm on ubuntu to act as a virtual tpm.<o:p></o:p></li><li c=
lass=3D"MsoListParagraph" style=3D"margin-left:0in;mso-list:l0 level1 lfo1"=
>Enabled measured boot, tpm, hash on u-boot
<o:p></o:p></li><li class=3D"MsoListParagraph" style=3D"margin-left:0in;mso=
-list:l0 level1 lfo1">Openbmc image loaded on qemu.
<o:p></o:p></li></ol>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">With this setup, I am trying to get the tpm device t=
hrough <b>
tcg2_platform_get_tpm2(struct udevice **dev) </b>from u-boot<b>(</b>image-f=
it.c<b>)
</b>. But I am getting error 19 (ENODEV). Any Idea why it is not recognizin=
g the virtual TPM running on ubuntu?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Sandeep. <o:p></o:p></p>
</div>
</div>
<br>
<p style=3D"font-family:Calibri;font-size:10pt;color:#000000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
TCS Confidential<br>
</p>
<p>=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D-----=3D=3D=3D=3D=3D<br>
Notice: The information contained in this e-mail<br>
message and/or attachments to it may contain <br>
confidential or privileged information. If you are <br>
not the intended recipient, any dissemination, use, <br>
review, distribution, printing or copying of the <br>
information contained in this e-mail message <br>
and/or attachments to it are strictly prohibited. If <br>
you have received this communication in error, <br>
please notify us by reply e-mail or telephone and <br>
immediately and permanently delete the message <br>
and any attachments. Thank you</p>

<p></p></body>
</html>

--_000_MA1PR01MB41291EE6564B664F91E3228F875BAMA1PR01MB4129INDP_--

