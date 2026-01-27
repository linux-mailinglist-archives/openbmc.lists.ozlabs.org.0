Return-Path: <openbmc+bounces-1285-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKRKHRnZeGmftgEAu9opvQ
	(envelope-from <openbmc+bounces-1285-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 16:26:17 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF7496A79
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 16:26:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0q4P5lDKz2xc8;
	Wed, 28 Jan 2026 02:26:13 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769527573;
	cv=none; b=j/7BtQPgUqMfQdXRYSwnDOiqPKgFA7HoNm07FtqxRprhDcT7zxXzqdumqNusCVbu29VVLhzm0nJ8Cf0Zc5KLDf9JK2MY7HXeO+QDKRvKHtYBJ9n7BeiEUBo4ahHKwcahE1yLkrR+oWpBxk09A4+RtPYte4CvZ9N737qFRLoS/daYz132W5dHnycLyAmDt6okwwU+zh3J4DM4EvoU+h6snBTAx5RYknW3PEw7XV5ojmb71aub4OxuvMnLXdZFcPCifs1KiTumnNvktYdMhuXT9Gz9ep+akO8ccKJfCbXKJ9s2na6V04m5KQIAy/1ZubUTVp8tIdjF2KMug8aAN0G/Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769527573; c=relaxed/relaxed;
	bh=dlmBsjkw84x+g5b6TsR7HoVLKdYHJCQQk3graKa+piU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GXYIdO3KL2enRSCRzn8/MQEbF6fxYji1UAYjNe6nSatmxlAcEy1jqCoUkSeQNcRZjUheurHGPOu6epCJScKRkCrzYNu+Ws+kbBgAx+jJg6ZBA+Ci2s4oSqpEDWZI7JmiSR5Y38IACptKqR4GFJNQ5BWcab833NDS3DG3evmmIG3FlIhs4TmY0puaSi1HsjkUh2d3L3DU5ReZ/y7h0rU9AmCS8c62r0QbjvoIouiAcyO9i+tzsYL9a6dkFqPRncjlowsKs2VJKZvcjXFZxelY8UyJqBRYKOP84p1V9z5CM+02SbzZ9otFm2iKz3A1uQMvw3fUbNLpbHhQ/W3n/c6DqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OiODPW+6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OiODPW+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0q4N6pcqz2xT6;
	Wed, 28 Jan 2026 02:26:12 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R728DH019338;
	Tue, 27 Jan 2026 15:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=dlmBsj
	kw84x+g5b6TsR7HoVLKdYHJCQQk3graKa+piU=; b=OiODPW+6UB6ood4M+i8oMF
	/mQ3zXfBJOFJlgNKePoM+Ywh3nTTHQw4KQjKvfe9fYO7DAcUXWD81DX5Hv7U4kE8
	Ncg3sfSZ9drf+wZHnXC2G93AqFRdizN9udFk2xEQvooQan3R2r8TtLTgJXI3RNh0
	rfd21JryLEJvnjk1WEP2RQHC1mNt+3yBeh7oWPKX9JrfgRDbsRxibb9pEh5UD85c
	G94LSW+DlvVRAvLJfNPQABb8p7qpBBBQif5Yaa/T1ZZRW/3wPSWmMdIsvRu3SdiS
	u3ZyRSthl8LzI2DcaW6uvBuWtFSHScPdVHQefBMTseMrwOMdY244/eotEpZbA4iQ
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvmgfvgb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:26:06 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60RCcnkw031024;
	Tue, 27 Jan 2026 15:26:06 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bw8dsh8fh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:26:06 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60RFQ5uq21824146
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 15:26:05 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0F0C58067;
	Tue, 27 Jan 2026 15:26:05 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5825158052;
	Tue, 27 Jan 2026 15:26:05 +0000 (GMT)
Received: from [9.61.135.234] (unknown [9.61.135.234])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 15:26:05 +0000 (GMT)
Message-ID: <e8b4d09c-f034-4e2f-9f05-109acd074864@linux.ibm.com>
Date: Tue, 27 Jan 2026 09:26:05 -0600
X-Mailing-List: openbmc@lists.ozlabs.org
List-Id: <openbmc.lists.ozlabs.org>
List-Help: <mailto:openbmc+help@lists.ozlabs.org>
List-Owner: <mailto:openbmc+owner@lists.ozlabs.org>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Subscribe: <mailto:openbmc+subscribe@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-digest@lists.ozlabs.org>,
  <mailto:openbmc+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:openbmc+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/13] i2c: fsi: Drop assigning fsi bus
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
 <8a36a0dba809d3bfe225627fd178daece10ff6a5.1765279318.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <8a36a0dba809d3bfe225627fd178daece10ff6a5.1765279318.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z4vh3XRA c=1 sm=1 tr=0 ts=6978d90e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=IpJZQVW2AAAA:8 a=VwQbUJbxAAAA:8 a=bKyC4-_fwZ91YHrlqQQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: _tXxP29DnSdE9Dv-CgRG3n93ZaHxvkB-
X-Proofpoint-ORIG-GUID: _tXxP29DnSdE9Dv-CgRG3n93ZaHxvkB-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNSBTYWx0ZWRfX0bXzp67aL2Ds
 F/wG1c2vZ3hnUQrDwQxaLpRknGyXsfWeFdgd8in5ILCesRpWUqsdkCfsijBRciJmKRZvqVLy/Gx
 aM0dNRqjHLgjoVuHpzEqWJxq3LF0Bb5E+Q5iXzs1NjtAG4xayjG5jr88t4xJcCZFYeePmwOzJA8
 SqwPeHJERph1/qzYaWHtjGXlVLf6+mYL3bXAXAYnyx/ladkbLfOMu9UfFVawKotKIMgKqM+ZRcV
 o4xPe+YSbvSf6nIO18djR5cBigdzgD60UjcdtSxMpZ+Pa/zHcmd8CYr+DvS6P5YH0IMIUEgC7cH
 y3t87tOkg74RlpbF/SQ/41nC7tBbdJoZ5eycj117JoMnQpvK9dMlW8mpBEVo3+godtunDScvU6p
 R8r7C07pRM/bLbXKunG7ZxKYbGSYFL607S3aTFrgTjxgS8pMYUcgLHno8c/iIYuy8HQ3eKo9FjV
 vzdyxohqLoBonraPEIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601270125
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[openbmc];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[eajames@linux.ibm.com,openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,baylibre.com:email];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1285-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+]
X-Rspamd-Queue-Id: 6DF7496A79
X-Rspamd-Action: no action


On 12/9/25 5:40 AM, Uwe Kleine-König wrote:
> Since commit FIXME ("fsi: Assign driver's bus in fsi_driver_register()")
> module_fsi_driver() cares about assigning the driver's bus member. Drop
> the explicit driver specific assignment.


Acked-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> ---
>   drivers/i2c/busses/i2c-fsi.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/i2c/busses/i2c-fsi.c b/drivers/i2c/busses/i2c-fsi.c
> index ae016a9431da..e98dd5dcac0f 100644
> --- a/drivers/i2c/busses/i2c-fsi.c
> +++ b/drivers/i2c/busses/i2c-fsi.c
> @@ -763,7 +763,6 @@ static struct fsi_driver fsi_i2c_driver = {
>   	.id_table = fsi_i2c_ids,
>   	.drv = {
>   		.name = "i2c-fsi",
> -		.bus = &fsi_bus_type,
>   		.probe = fsi_i2c_probe,
>   		.remove = fsi_i2c_remove,
>   	},

