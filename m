Return-Path: <openbmc+bounces-1287-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEPoC0TaeGmwtgEAu9opvQ
	(envelope-from <openbmc+bounces-1287-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 16:31:16 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6C696BE9
	for <lists+openbmc@lfdr.de>; Tue, 27 Jan 2026 16:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f0qB84nQzz2yGM;
	Wed, 28 Jan 2026 02:31:12 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769527872;
	cv=none; b=IFFbsfqDqcRbl/2cjY2XmRkWfd7dSbqXwcixaehAKWd4q+tXz7W3XQBBmeSczH/C3aHKABGvMjC6uYvYoWLfS3cRCs+hCZ8NwIIL9lTSDkCj9k6uTYzqjIu5TUbZBY/Oz3m/tIttAXg1qXt+7t8+kyVe11EKcBk2MOliCs/kbkvmu9oCqWDEkotSuvnGVijFWO/s3q6nfZoVuwwWAyr3MfF4yjJDnjorV5vDeuOXzGzmxoJPrEdCVjJuau52jyrsHnlpmhfPSrPpEELZbpbRvKzvi18YBv+0z1s8/hs+PsnF0xHRVtPaqp2jqQFFflts7nrZPbbuRRVx8HNmpaS82w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769527872; c=relaxed/relaxed;
	bh=CcuRSYpvHj6NoHofQbMK93lkeOoKjGd3IwYs/c/IxcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cO3ZxbkuZsh1PqRZi2zowvYUko7cWHaN+K+Lr44kW9aNEViGBmxJQRU7WCfB5v4I2vWJBw0eG0jubTJoyv5o8mlIqVltMvnYjXtXRmQOS5oDd5VuvZoQrU8wI2QgQ65zS1zZN+AkJ1dejsKjiMiFvSMYixkpx52gnkGMk6Me+Mml87N/LToh1/6twGAYiZjb7HTNkA/52Dy3M2RXJOdFo1Pt8GId8fR6Y7j80Mib97KQX+LHBrAXPpVaVMECeNbc9Y9s2oBZ9akcyfOd2Dylox+UHR9uoKsfxvWAUOBhKtj+wjzfq8qAmtX/2pJmXhsh+4i0TAZOl7erIY2ZqEne9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iCH3j8ia; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iCH3j8ia;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f0qB74z7pz2xXB;
	Wed, 28 Jan 2026 02:31:11 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60R53arZ031029;
	Tue, 27 Jan 2026 15:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=CcuRSY
	pvHj6NoHofQbMK93lkeOoKjGd3IwYs/c/IxcQ=; b=iCH3j8ia3qRRLntKhAZHwU
	WbCNDPZtVaxKK4wvgFSTcNtRgfu60RXVXdxYtMsZVJq22XZ0OP2pauAY+ynIxuGq
	eGkG8UCNBbVACirf8pobSq2rN90OGqzww7XxnyVkjUcPj+ldyzcf+At3EYETmxQJ
	zQhLJZ/HzcuGz9mGRGTV1V2EI7yn/FXVXQN7P1HGlvAbCxzAVg7JWiOkdWfHn62d
	d01/x5wf4JUgIHkSL2U1Xmh8uJXuGebLmSq6mmRTVFPu1DHB1Sf/IOseSFAqeNa3
	Y6vwxTHRwzFVqlcXTtzvJIoz9gSYJ4umc/UHMj9OVp3RYH4E1X1PBsyvmncJREfQ
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr64ajh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:31:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60RDBBYE006725;
	Tue, 27 Jan 2026 15:31:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bw8sy994r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 15:31:04 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60RFV4Cv31785556
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 Jan 2026 15:31:04 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F219C5805D;
	Tue, 27 Jan 2026 15:31:03 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BC2458052;
	Tue, 27 Jan 2026 15:31:03 +0000 (GMT)
Received: from [9.61.135.234] (unknown [9.61.135.234])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 Jan 2026 15:31:03 +0000 (GMT)
Message-ID: <e29b29d7-b002-4d18-a476-dd129154ba08@linux.ibm.com>
Date: Tue, 27 Jan 2026 09:31:03 -0600
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
Subject: Re: [PATCH v2 00/13] fsi: Convert to bus probe mechanism
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>, linux-fsi@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
References: <cover.1765279318.git.u.kleine-koenig@baylibre.com>
 <rwvoi4v3wcrfcbj2sg6mknlasp5klrlpacgwgl2jvwh6ub6vls@iovrqjblvz44>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <rwvoi4v3wcrfcbj2sg6mknlasp5klrlpacgwgl2jvwh6ub6vls@iovrqjblvz44>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNSBTYWx0ZWRfX5+4qhV5CuyMd
 6mz2ij7H/90BTOVTToBPAGimZNpON3mEFuu8RYU2ei3t1OzD0z66dwXvU1ojN/gMNAcx+qORL6O
 CUbQh0t0u2qfpUZM7/KJzRESq3SAw9r2FQrk5uIyTv1CDnB3iAFpLrvMUdfCTULY38usEWFRHl4
 DWYOHv9Eg6qLc2C/wrZPFid4htoWdr9duOKeYK+S2bPRdasBX/DFXB8ZED6R3+kPSCQpF+Xh8tN
 QeCeA/8RasupiV36oqfT6e9L7Iy5YB9eorhwCY96vQL5uvOCD8DkdzgclNTqt/OT8VhReX+uiIu
 5uVv0HagKt7VT/ArPdu/m9DoiJhbgHngy1rPgD77rrWgPxAPDxzSgjNUJWs3aFcZMa5PWxzaKid
 VLTBl2vvO0ph746qScEeAj92RY2pwlJ8fx02QGbmM7ZUq8AQ+L+7UFW6ursd4HR5sivvvIq3J+G
 /fBR64CN2AxZWKNjD8w==
X-Proofpoint-GUID: OrbwkcODKPI3bhAADLWK0Xbh4LjB6tbb
X-Proofpoint-ORIG-GUID: OrbwkcODKPI3bhAADLWK0Xbh4LjB6tbb
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=6978da39 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NN-yl_if-6FwqtqQtZUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601270125
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1287-lists,openbmc=lfdr.de];
	DKIM_TRACE(0.00)[ibm.com:+]
X-Rspamd-Queue-Id: 2E6C696BE9
X-Rspamd-Action: no action


On 1/12/26 3:47 AM, Uwe Kleine-König wrote:
> Hello Eddie,
>
> On Tue, Dec 09, 2025 at 12:39:28PM +0100, Uwe Kleine-König wrote:
>> Hello,
>>
>> this is the 2nd installment of the series converting the fsi bus to use
>> bus methods for .probe and .remove. The changes since the first
>> iteration---that can be found at
>> https://lore.kernel.org/lkml/cover.1764434226.git.ukleinek@kernel.org/
>> --- are:
>>
>>   - (trivially) rebase to v6.18
>>   - add tags by Andi (for the i2c parts) and Mark Brown (for the spi
>>     parts)
>>   - Add a patch converting drivers/fsi/i2cr-scom.c (#8)
>>
>> In the earlier thread I thought I made a mistake for (implicit) v1, but
>> I confused fsi with fsl and the problem doesn't apply here as it doesn't
>> touch the shutdown callback.
>>
>> This series is not urgent, but it would be great to get this into
>> v6.19-rc1.  With Mark's Acks and Andi's tags (though they are not an
>> Ack) this should be fine to be picked up in one go by Eddie.
>>
>> As before there are two commit refs that should refer to the commit for
>> patch #2 ("fsi: Assign driver's bus in fsi_driver_register()"). As I
>> cannot know the commit hash yet, I wrote "FIXME" and these need updating
>> when the series is picked up.
> gentle ping. While my quest to drop .probe() and .remove() is still in
> early stages, I'd like to see this series go in before it bitrots. It
> should have all the acks necessary to merge it.


So sorry for the delay. Thank you very much for the series! Greg, please 
merge at your earliest convenience.


Thanks!

Eddie


>
> Alternatively, should I ask Greg (added to Cc:) to merge?
>
> Best regards
> Uwe

