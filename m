Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D32A05D8F8
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 02:32:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dhrd4FdTzDqLs
	for <lists+openbmc@lfdr.de>; Wed,  3 Jul 2019 10:32:17 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=aj.id.au
 (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com;
 envelope-from=andrew@aj.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=aj.id.au header.i=@aj.id.au header.b="GGrCQYH4"; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.b="ptipRFXT"; dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dhr11VdfzDqS4
 for <openbmc@lists.ozlabs.org>; Wed,  3 Jul 2019 10:31:44 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 12BFD21470;
 Tue,  2 Jul 2019 20:31:40 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Tue, 02 Jul 2019 20:31:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=Q79LYp7xVTLtMAezaEao6NUkHgzKKrD
 ukBD9xulLHEE=; b=GGrCQYH4nI15On065NdUbExeFC7RGGzRWMQMNa20/1s4vsP
 Rk36wyS7DSSdZiHUAagQDuWkM0nwkIxceO8tdj3RS5AEfDmwMMlS9bDC+lxQfTFz
 JFF5tnDKVYxP5D3YCKpug3vZuz4oM0pa6EyYs26k54sYGiUJXDZcmw68Z+Wx+xDV
 Fbr0HsHzCwzQA8wWWqpA72/BQWfsTn4i9DJnm8RS9w+x9JRiVizJWGb30LRyIKPp
 Ybm9S1VxKV0O+PK5a8k9qW15kRdVU3e8QHjUWNm8eRhi5GZZT/imQTGr8uLTVOU+
 LTo9OMsuL3GGzSDw21osuT6nRujrLksTysCZFbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Q79LYp
 7xVTLtMAezaEao6NUkHgzKKrDukBD9xulLHEE=; b=ptipRFXTy+IkUtLu24L41C
 zkoVA69FXac/3faxPGNjpZaAdj8Hj/G83O1yw5/ntVwS5UKITQBv7lnAniA246A0
 jVXkG59nOcwxTuZ2ClQCXUlCbIk6ozM+6dgQYRROflLgT7efOfvk0f7CnutjxDth
 kQZBQWGxYTEIr1jWusalvBsxopQn5Teg1hhdmCIFsEmtRgFoWN+9NYpvuBhzcchw
 oEghDphovu/G/YbFX2Dm9/XspcLEWHuTEBG7Symv2SInG3qO9Yf2FtISRsArSQs3
 Z+W6N5UaD0iazd/HRMDKY8/Aw3v6C/hIgP4pzNgBP4EYBEg25oJmuRbW//eXVWxw
 ==
X-ME-Sender: <xms:a_cbXdUJ9PSFA9R9TLSmOuam8-UiUNob7k4962UZWXoRtjOWuPjXLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrvdelgdefhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehnughr
 vgifucflvghffhgvrhihfdcuoegrnhgurhgvfiesrghjrdhiugdrrghuqeenucfrrghrrg
 hmpehmrghilhhfrhhomheprghnughrvgifsegrjhdrihgurdgruhenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:a_cbXQ21xH8_3JxgZQQ8WbGka00Ab_Y6ZNhc8SDc2iJbPGPuOlODJA>
 <xmx:a_cbXdcw9liktbCTmFIWNyE-cbwiQ8jtFUzdYfhdnVwvnASvZ_4G1w>
 <xmx:a_cbXaUwc1GISJcUSLTKW3SAwnh40x4XGwIguXeRF37pCgRiJVNcfA>
 <xmx:bPcbXeA5MdpvhHMEwTWpSDFApGwuVW2pQovtcKAXoNZZ_b3KDKTqGA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 07ED9E00A2; Tue,  2 Jul 2019 20:31:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <95aa5594-325b-45d4-b777-075426ca3244@www.fastmail.com>
In-Reply-To: <1560285038-24233-1-git-send-email-eajames@linux.ibm.com>
References: <1560285038-24233-1-git-send-email-eajames@linux.ibm.com>
Date: Wed, 03 Jul 2019 10:31:38 +1000
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Eddie James" <eajames@linux.ibm.com>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] OCC: FSI and hwmon: Add sequence numbering
Content-Type: text/plain
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

On Wed, 12 Jun 2019, at 06:31, Eddie James wrote:
> Sequence numbering of the commands submitted to the OCC is required by
> the OCC interface specification. Add sequence numbering and check for
> the correct sequence number on the response.
> 
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/fsi/fsi-occ.c      | 15 ++++++++++++---
>  drivers/hwmon/occ/common.c |  4 ++--
>  drivers/hwmon/occ/common.h |  1 +
>  3 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
> index a2301ce..7da9c81 100644
> --- a/drivers/fsi/fsi-occ.c
> +++ b/drivers/fsi/fsi-occ.c
> @@ -412,6 +412,7 @@ int fsi_occ_submit(struct device *dev, const void 
> *request, size_t req_len,
>  		msecs_to_jiffies(OCC_CMD_IN_PRG_WAIT_MS);
>  	struct occ *occ = dev_get_drvdata(dev);
>  	struct occ_response *resp = response;
> +	u8 seq_no;
>  	u16 resp_data_length;
>  	unsigned long start;
>  	int rc;
> @@ -426,6 +427,8 @@ int fsi_occ_submit(struct device *dev, const void 
> *request, size_t req_len,
>  
>  	mutex_lock(&occ->occ_lock);
>  
> +	/* Extract the seq_no from the command (first byte) */
> +	seq_no = *(const u8 *)request;

The fact that your doing this says to me that the fsi_occ_submit() interface
is wrong.

We already have `struct occ_response` in drivers/hwmon/occ/common.h.
I think we should add an equivalent `struct occ_request` and pass a
typed pointer through fsi_occ_submit(), that way we can access the
sequence number by name rather than through dodgy casts.

Also why is this sent just to the OpenBMC list? Any reason it's not on
upstream lists?

Andrew

>  	rc = occ_putsram(occ, OCC_SRAM_CMD_ADDR, request, req_len);
>  	if (rc)
>  		goto done;
> @@ -441,11 +444,17 @@ int fsi_occ_submit(struct device *dev, const void 
> *request, size_t req_len,
>  		if (rc)
>  			goto done;
>  
> -		if (resp->return_status == OCC_RESP_CMD_IN_PRG) {
> +		if (resp->return_status == OCC_RESP_CMD_IN_PRG ||
> +		    resp->seq_no != seq_no) {
>  			rc = -ETIMEDOUT;
>  
> -			if (time_after(jiffies, start + timeout))
> -				break;
> +			if (time_after(jiffies, start + timeout)) {
> +				dev_err(occ->dev, "resp timeout status=%02x "
> +					"resp seq_no=%d our seq_no=%d\n",
> +					resp->return_status, resp->seq_no,
> +					seq_no);
> +				goto done;
> +			}
>  
>  			set_current_state(TASK_UNINTERRUPTIBLE);
>  			schedule_timeout(wait_time);
> diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
> index d7cc0d2..e9d7167 100644
> --- a/drivers/hwmon/occ/common.c
> +++ b/drivers/hwmon/occ/common.c
> @@ -122,12 +122,12 @@ struct extended_sensor {
>  static int occ_poll(struct occ *occ)
>  {
>  	int rc;
> -	u16 checksum = occ->poll_cmd_data + 1;
> +	u16 checksum = occ->poll_cmd_data + occ->seq_no + 1;
>  	u8 cmd[8];
>  	struct occ_poll_response_header *header;
>  
>  	/* big endian */
> -	cmd[0] = 0;			/* sequence number */
> +	cmd[0] = occ->seq_no++;		/* sequence number */
>  	cmd[1] = 0;			/* cmd type */
>  	cmd[2] = 0;			/* data length msb */
>  	cmd[3] = 1;			/* data length lsb */
> diff --git a/drivers/hwmon/occ/common.h b/drivers/hwmon/occ/common.h
> index fc13f3c..67e6968 100644
> --- a/drivers/hwmon/occ/common.h
> +++ b/drivers/hwmon/occ/common.h
> @@ -95,6 +95,7 @@ struct occ {
>  	struct occ_sensors sensors;
>  
>  	int powr_sample_time_us;	/* average power sample time */
> +	u8 seq_no;
>  	u8 poll_cmd_data;		/* to perform OCC poll command */
>  	int (*send_cmd)(struct occ *occ, u8 *cmd);
>  
> -- 
> 1.8.3.1
> 
>
