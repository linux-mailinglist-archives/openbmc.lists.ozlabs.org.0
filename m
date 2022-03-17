Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A408B4DC75D
	for <lists+openbmc@lfdr.de>; Thu, 17 Mar 2022 14:14:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK70J3QK5z30Dy
	for <lists+openbmc@lfdr.de>; Fri, 18 Mar 2022 00:14:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nQ9VUi9s;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=nQ9VUi9s; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK6zm3Xwfz2y8P;
 Fri, 18 Mar 2022 00:14:10 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id b189so4236225qkf.11;
 Thu, 17 Mar 2022 06:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=eWle4zbRf1n3H9JH+hlY46qvlaTRjOJL9WeucImHHOg=;
 b=nQ9VUi9sYyhAlmOegG+gL9U+A+k4L0h3YbQdoECtJViy3ucmZmKvZbk1M0lo+zElvW
 P9QSK1XhNmYuYVYGUa4pn2HOk/+sPmEIyA8nJj1ORGBwTzypv/YjSfxjqBBv6jn1eNeG
 89VNacmyZlqb1Uypy/SZJdjFDbtbS6s0lYo93muJrNmZ3/2jvRBimBDe0cievdvHo+Z8
 3xD6agc2lgghKoxsnMGk5BQTXecQgdNI+v1T7rxp+u0WV0oQrU5/puPU1EwhqTDoG1So
 Tb1r1r0sN/GtE8Oz4B01M5OFORYzkn6/F7euKMNyobLT1mwrOVYUzoP29R3AHyy5Qqa+
 2pKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=eWle4zbRf1n3H9JH+hlY46qvlaTRjOJL9WeucImHHOg=;
 b=ISOIotKJ3Emm0UrJwANFd/ekBFG6yAls1iNOBXnMGZKHES98+smF5G9FNx9Jjsy7oQ
 +91G9NHbz9HHv2V5RQz9FUKFbMSRTadMb+f6QFom7gQmAO+QmX7F4Yd8zggvw9f/E8V4
 MqXEnZddgo/XS/E65jb8YbPuLVR6jh3I1w/wJBB7tJU89BrpwDIGx2j2LU4UVj03cclO
 FpCO+bZHyvbOXVoRAJPFUu7EWkFEisozFKwg7MU4KbobXhk9U05PbSfoRUbsuaHMCVyx
 KqYCwOJ5hCtOGHZf0hujDNGHFkiXgqPuk2hmYrw+XyfYN9n/csYyEEMSO90dBTgd4/Aq
 /aYA==
X-Gm-Message-State: AOAM532ONu1A7cBt2vjE0hAwM7dicl3wtZ61fBvliM+U32DpXAnWbJeL
 0k9iboAMKmQzFEbPUrpL4A==
X-Google-Smtp-Source: ABdhPJyjMKdRe3h0gF9p5mD85cMhaUnlFewNeqxPQzyz5DcwwNrVVLR63pDXDdHBePDcGgad/48sdA==
X-Received: by 2002:a05:620a:271d:b0:67d:bb5f:8a7d with SMTP id
 b29-20020a05620a271d00b0067dbb5f8a7dmr2684691qkp.154.1647522844635; 
 Thu, 17 Mar 2022 06:14:04 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 j67-20020a37b946000000b0067b221281dbsm2445827qkf.99.2022.03.17.06.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 06:13:59 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:797c:2e79:7998:93c9])
 by serve.minyard.net (Postfix) with ESMTPSA id 43EEA180004;
 Thu, 17 Mar 2022 13:13:57 +0000 (UTC)
Date: Thu, 17 Mar 2022 08:13:56 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [PATCH v6 1/4] ipmi: ssif_bmc: Add SSIF BMC driver
Message-ID: <20220317131356.GC3457@minyard.net>
References: <20220310114119.13736-1-quan@os.amperecomputing.com>
 <20220310114119.13736-2-quan@os.amperecomputing.com>
 <20220311011942.GX3457@minyard.net>
 <569f50d5-8f13-280e-b944-6e26d95dc50b@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <569f50d5-8f13-280e-b944-6e26d95dc50b@os.amperecomputing.com>
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
Reply-To: minyard@acm.org
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Andrew Jeffery <andrew@aj.id.au>, openbmc@lists.ozlabs.org,
 "Thang Q . Nguyen" <thang@os.amperecomputing.com>,
 Brendan Higgins <brendanhiggins@google.com>, linux-kernel@vger.kernel.org,
 Phong Vo <phong@os.amperecomputing.com>, Wolfram Sang <wsa@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

snip...
> > > +
> > > +static void response_timeout(struct timer_list *t)
> > > +{
> > > +	struct ssif_bmc_ctx *ssif_bmc = from_timer(ssif_bmc, t, response_timer);
> > > +	unsigned long flags;
> > > +
> > 
> > Is there a possible race here?  The timeout can happen at the same time
> > as a received message, will something bad happen if that's the case?
> > 
> 
> Thanks Corey,
> I think I need extra comment here.
> 
> The purpose of this timeout is to make sure ssif_bmc will recover from busy
> state in case the upper stack does not provide the response.
> Hence, the response timeout is set as 500ms, twice the time of max
> Request-to-Response in spec as the code below. Should it be longer?

That's not what I was asking.  I know what the timer is for.  But what
happens if the response comes in at the same time this timer goes off?
What will keep the data from getting messed up?

> 
> As per spec, the max Request-to-Respose would not exceed 250ms.
> 
> I put the comment in ssif_bmc.h as below:
> >> +/*
> >> + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
> >> + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
> >> + * Recover ssif_bmc from busy state if it takes upto 500ms
> >> + */
> >> +#define RESPONSE_TIMEOUT			500 /* ms */
> 
> 
> > > +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> > > +
> > > +	/* Recover ssif_bmc from busy */
> > > +	ssif_bmc->busy = false;
> > > +	del_timer(&ssif_bmc->response_timer);
> > 
> > You don't need to delete the timer, it's in the timeout.
> > 
> 
> Will remove this redundant code in next version
> 
> > > +	ssif_bmc->response_timer_inited = false;
> > > +
> > > +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> > > +}
> > > +
> > > +/* Called with ssif_bmc->lock held. */
> > > +static void handle_request(struct ssif_bmc_ctx *ssif_bmc)
> > > +{
> > > +	/* set ssif_bmc to busy waiting for response */
> > > +	ssif_bmc->busy = true;
> > > +
> > > +	/* Request message is available to process */
> > > +	ssif_bmc->request_available = true;
> > > +
> > > +	/* Clean old response buffer */
> > > +	memset(&ssif_bmc->response, 0, sizeof(struct ssif_msg));
> > > +
> > > +	/* This is the new READ request.*/
> > > +	wake_up_all(&ssif_bmc->wait_queue);
> > > +
> > > +	/* Armed timer to recover slave from busy state in case of no response */
> > > +	if (!ssif_bmc->response_timer_inited) {
> > > +		timer_setup(&ssif_bmc->response_timer, response_timeout, 0);
> > > +		ssif_bmc->response_timer_inited = true;
> > > +	}
> > > +	mod_timer(&ssif_bmc->response_timer, jiffies + msecs_to_jiffies(RESPONSE_TIMEOUT));
> > > +}
> > > +
> > > +static void set_multipart_response_buffer(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	u8 response_len = 0;
> > > +	int idx = 0;
> > > +	u8 data_len;
> > > +
> > > +	data_len = ssif_bmc->response.len;
> > > +	switch (ssif_bmc->smbus_cmd) {
> > > +	case SSIF_IPMI_MULTIPART_READ_START:
> > > +		/*
> > > +		 * Read Start length is 32 bytes.
> > > +		 * Read Start transfer first 30 bytes of IPMI response
> > > +		 * and 2 special code 0x00, 0x01.
> > > +		 */
> > > +		*val = MAX_PAYLOAD_PER_TRANSACTION;
> > > +		ssif_bmc->remain_len = data_len - MAX_IPMI_DATA_PER_START_TRANSACTION;
> > > +		ssif_bmc->block_num = 0;
> > 
> > Do you need to validate the data length before using this?
> > This applies for lots of places through here.
> > 
> 
> set_multipart_response_buffer() is called only when ->is_singlepart_read is
> false, which is determined by the below code under the *_write()
> 
> ssif_bmc->is_singlepart_read = (ssif_msg_len(&msg) <=
> MAX_PAYLOAD_PER_TRANSACTION + 1);
> 
> So, I think the len is validated and could be use in this functions.

Ah, I had things backwards.  "Read" here is when you are writing to
the other side.  I understand now.

> 
> > > +
> > > +		ssif_bmc->response_buf[idx++] = 0x00; /* Start Flag */
> > > +		ssif_bmc->response_buf[idx++] = 0x01; /* Start Flag */
> > > +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.netfn_lun;
> > > +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.cmd;
> > > +		ssif_bmc->response_buf[idx++] = ssif_bmc->response.payload[0];
> > > +
> > > +		response_len = MAX_PAYLOAD_PER_TRANSACTION - idx;
> > > +
> > > +		memcpy(&ssif_bmc->response_buf[idx], &ssif_bmc->response.payload[1],
> > > +		       response_len);
> > > +		break;
> > > +
> > > +	case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> > > +		/*
> > > +		 * IPMI READ Middle or READ End messages can carry up to 31 bytes
> > > +		 * IPMI data plus block number byte.
> > > +		 */
> > > +		if (ssif_bmc->remain_len < MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION) {
> > > +			/*
> > > +			 * This is READ End message
> > > +			 *  Return length is the remaining response data length
> > > +			 *  plus block number
> > > +			 *  Block number 0xFF is to indicate this is last message
> > > +			 *
> > > +			 */
> > > +			*val = ssif_bmc->remain_len + 1;
> > > +			ssif_bmc->block_num = 0xFF;
> > > +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> > > +			response_len = ssif_bmc->remain_len;
> > > +			/* Clean the buffer */
> > > +			memset(&ssif_bmc->response_buf[idx], 0, MAX_PAYLOAD_PER_TRANSACTION - idx);
> > > +		} else {
> > > +			/*
> > > +			 * This is READ Middle message
> > > +			 *  Response length is the maximum SMBUS transfer length
> > > +			 *  Block number byte is incremented
> > > +			 * Return length is maximum SMBUS transfer length
> > > +			 */
> > > +			*val = MAX_PAYLOAD_PER_TRANSACTION;
> > > +			ssif_bmc->remain_len -= MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> > > +			response_len = MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION;
> > > +			ssif_bmc->response_buf[idx++] = ssif_bmc->block_num;
> > > +			ssif_bmc->block_num++;
> > > +		}
> > > +
> > > +		memcpy(&ssif_bmc->response_buf[idx],
> > > +		       ssif_bmc->response.payload + 1 + ssif_bmc->nbytes_processed,
> > > +		       response_len);
> > > +		break;
> > > +
> > > +	default:
> > > +		/* Do not expect to go to this case */
> > > +		dev_err(&ssif_bmc->client->dev,
> > > +			"%s: Unexpected SMBus command 0x%x\n",
> > > +			__func__, ssif_bmc->smbus_cmd);
> > > +		break;
> > > +	}
> > > +
> > > +	ssif_bmc->nbytes_processed += response_len;
> > > +}
> > > +
> > > +/* Process the IPMI response that will be read by master */
> > > +static void handle_read_processed(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	u8 *buf;
> > > +	u8 pec_len, addr, len;
> > > +	u8 pec = 0;
> > > +
> > > +	pec_len = ssif_bmc->pec_support ? 1 : 0;
> > > +	/* PEC - Start Read Address */
> > > +	addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> > > +	pec = i2c_smbus_pec(pec, &addr, 1);
> > > +	/* PEC - SSIF Command */
> > > +	pec = i2c_smbus_pec(pec, &ssif_bmc->smbus_cmd, 1);
> > > +	/* PEC - Restart Write Address */
> > > +	addr = addr | 0x01;
> > > +	pec = i2c_smbus_pec(pec, &addr, 1);
> > > +
> > > +	if (ssif_bmc->is_singlepart_read) {
> > > +		/* Single-part Read processing */
> > > +		buf = (u8 *)&ssif_bmc->response;
> > > +
> > > +		if (ssif_bmc->response.len && ssif_bmc->msg_idx < ssif_bmc->response.len) {
> > > +			ssif_bmc->msg_idx++;
> > > +			*val = buf[ssif_bmc->msg_idx];
> > > +		} else if (ssif_bmc->response.len && ssif_bmc->msg_idx == ssif_bmc->response.len) {
> > > +			ssif_bmc->msg_idx++;
> > > +			*val = i2c_smbus_pec(pec, buf, ssif_msg_len(&ssif_bmc->response));
> > > +		} else {
> > 
> > I thought for a second that this was wrong, but I think it's correct.
> > Supply zero if you don't have data.
> > 
> > > +			*val = 0;
> > > +		}
> > > +		/* Invalidate response buffer to denote it is sent */
> > > +		if (ssif_bmc->msg_idx + 1 >= (ssif_msg_len(&ssif_bmc->response) + pec_len))
> > > +			complete_response(ssif_bmc);
> > > +	} else {
> > > +		/* Multi-part Read processing */
> > 
> > You don't check the length here like you did above.  I think that's
> > required.
> > 
> 
> As per my explanation above, the ->is_singlepart_read is determined by
> testing the length, so it is validated as I assumed.
> 
> > > +		switch (ssif_bmc->smbus_cmd) {
> > > +		case SSIF_IPMI_MULTIPART_READ_START:
> > > +		case SSIF_IPMI_MULTIPART_READ_MIDDLE:
> > > +			buf = (u8 *)&ssif_bmc->response_buf;
> > > +			*val = buf[ssif_bmc->msg_idx];
> > > +			ssif_bmc->msg_idx++;
> > > +			break;
> > > +		default:
> > > +			/* Do not expect to go to this case */
> > > +			dev_err(&ssif_bmc->client->dev,
> > > +				"%s: Unexpected SMBus command 0x%x\n",
> > > +				__func__, ssif_bmc->smbus_cmd);
> > > +			break;
> > > +		}
> > > +
> > > +		len = (ssif_bmc->block_num == 0xFF) ?
> > > +		       ssif_bmc->remain_len + 1 : MAX_PAYLOAD_PER_TRANSACTION;
> > > +		if (ssif_bmc->msg_idx == (len + 1)) {
> > > +			pec = i2c_smbus_pec(pec, &len, 1);
> > > +			*val = i2c_smbus_pec(pec, ssif_bmc->response_buf, len);
> > > +		}
> > > +		/* Invalidate response buffer to denote last response is sent */
> > > +		if (ssif_bmc->block_num == 0xFF &&
> > > +		    ssif_bmc->msg_idx > (ssif_bmc->remain_len + pec_len)) {
> > > +			complete_response(ssif_bmc);
> > > +		}
> > > +	}
> > > +}
> > > +
> > > +static void handle_write_received(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	u8 *buf = (u8 *)&ssif_bmc->request;
> > > +
> > > +	if (ssif_bmc->msg_idx >= sizeof(struct ssif_msg))
> > > +		return;

I don't think this check is valid.  I believe the msg_idx only covers
the current message, but ssif_msg is a full multi-part message.  It
covers the single-part message, I think but not the multi-part ones.
Also, abort the operation and log on bad data.

> > > +
> > > +	switch (ssif_bmc->smbus_cmd) {
> > > +	case SSIF_IPMI_SINGLEPART_WRITE:
> > > +		buf[ssif_bmc->msg_idx - 1] = *val;
> > > +		ssif_bmc->msg_idx++;
> > > +
> > > +		break;
> > > +	case SSIF_IPMI_MULTIPART_WRITE_START:
> > > +		if (ssif_bmc->msg_idx == 1)
> > > +			ssif_bmc->request.len = 0;
> > > +
> > > +		fallthrough;
> > > +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> > > +		/* The len should always be 32 */
> > > +		if (ssif_bmc->msg_idx == 1 && *val != MAX_PAYLOAD_PER_TRANSACTION)
> > > +			dev_warn(&ssif_bmc->client->dev,
> > > +				 "Warn: Invalid Multipart Write len");

You should abort the operation here.  Don't deliver obviously bad data.
Same in the code just below.

This will require that you add a message aborted type of state to just
ignore everything that comes in until the full sequence ends or a new
message starts.

> > > +
> > > +		fallthrough;
> > > +	case SSIF_IPMI_MULTIPART_WRITE_END:
> > > +		/* Multi-part write, 2nd byte received is length */
> > > +		if (ssif_bmc->msg_idx == 1) {
> > > +			if (*val > MAX_PAYLOAD_PER_TRANSACTION)
> > > +				dev_warn(&ssif_bmc->client->dev,
> > > +					 "Warn: Invalid Multipart Write End len");
> > > +
> > > +			ssif_bmc->request.len += *val;
> > > +			ssif_bmc->recv_len = *val;
> > > +
> > > +			/* request len should never exceeded 255 bytes */
> > > +			if (ssif_bmc->request.len > 255)
> > > +				dev_warn(&ssif_bmc->client->dev,
> > > +					 "Warn: Invalid request len");
> > > +
> > > +		} else {
> > 
> > You check msg_idx above, but I'm not sure that check will cover this
> > operation.
> > 
> That check is to make sure the length (*val) must always be strictly 32
> bytes in case of MULTIPART_WRITE_START/MIDDLE. And this check allows the
> length is up to 32 bytes in MULTIPART_WRITE_END.

Now that I have read and write straight, this is where the previous
comments apply.

You are trusting the the length sent by the remote end in the second
byte is correct, but there is no guarantee of this.  The remote end can
send as many bytes as it likes.  You need to check that you don't
overflow buf here and that it actually sends the number of bytes that it
said it was going to send to avoid underflow.

> 
> > > +			buf[ssif_bmc->msg_idx - 1 +
> > > +			    ssif_bmc->request.len - ssif_bmc->recv_len]	= *val;

This computation is fairly complicated and hard to understand.
Calculations like this are asking for trouble.

It would be easier to understand had request.len be the current length
of what is in request.payload and increment it on every incoming byte.
Then request.len could be used to add data to the buffer, like

	if (ssif_bmc->request.len >= sizeof(ssif_bmc->payload))
		error...
	ssif_bmc->payload[ssif_bmc->request.len++] = *val;

If you renamed msg_idx to curr_recv_idx and recv_len to curr_recv_len,
it would be more clear that these are related and operate on the current
incoming message.

It would also be nice to get rid of the casts from ssif_msg to a buffer
array and just index directly into request.payload[].

In thinking about this further, I have a few more observations...

There is no need to have the netfn and cmd in ssif_msg.  They are just
the first and second bytes of the message.  You don't care what they
are in this code.

Why do you deliver the length as part of the message to the user?  The
length is returned by the system call.  You have all these +1 and -1
things around the message length, which is error-prone.  Removing the
length from the message would get rid of all of that.  And using packed
structures is generally not the best, anyway.

The PEC calculations remove one byte from the maximum message length.
Since they are not included in the length byte, it's kind of unnatural
to do this the way you are doing it.  Instead, it might be best to say
if you receive a byte and curr_recv_idx == curr_recv_len, process it
as PEC.  That way the PEC never hits the buffer.

There is no need for msg_idx, or cur_recv_idx, to be size_t.

I need to look at this some more, but I'll need to see the rewrite.

-corey

> > > +		}
> > > +
> > > +		ssif_bmc->msg_idx++;
> > > +
> > > +		break;
> > > +	default:
> > > +		/* Do not expect to go to this case */
> > > +		dev_err(&ssif_bmc->client->dev,
> > > +			"%s: Unexpected SMBus command 0x%x\n",
> > > +			__func__, ssif_bmc->smbus_cmd);
> > > +		break;
> > > +	}
> > > +}
> > > +
> > > +static bool validate_request(struct ssif_bmc_ctx *ssif_bmc)
> > > +{
> > > +	u8 rpec = 0, cpec = 0;
> > > +	bool ret = true;
> > > +	u8 addr, index;
> > > +	u8 *buf;
> > > +
> > 
> > Is there any length validation for using buf below?  It looks like you
> > are accessing without checking length, but maybe I missed something.
> > 
> 
> Yes, there is length testing for each part before using buf to calculate PEC
> as in the "if" below.
> 
> > > +	buf = (u8 *)&ssif_bmc->request;
> > > +	switch (ssif_bmc->smbus_cmd) {
> > > +	case SSIF_IPMI_SINGLEPART_WRITE:
> > > +		if ((ssif_bmc->msg_idx - 1) == ssif_msg_len(&ssif_bmc->request)) {
> > > +			/* PEC is not included */
> > > +			ssif_bmc->pec_support = false;
> > > +			ret = true;
> > > +			goto exit;
> > > +		}
> > > +
> > > +		if ((ssif_bmc->msg_idx - 1) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
> > > +			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
> > > +				ssif_msg_len(&ssif_bmc->request));
> > > +			ret = false;
> > > +			goto exit;
> > > +		}
> > > +
> > > +		/* PEC is included */
> > > +		ssif_bmc->pec_support = true;
> > > +		rpec = buf[ssif_bmc->msg_idx - 2];
> > > +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> > > +		cpec = i2c_smbus_pec(cpec, &addr, 1);
> > > +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
> > > +		cpec = i2c_smbus_pec(cpec, buf, ssif_msg_len(&ssif_bmc->request));
> > > +		if (rpec != cpec) {
> > > +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
> > > +			ret = false;
> > > +		}
> > > +
> > > +		break;
> > > +	case SSIF_IPMI_MULTIPART_WRITE_START:
> > > +	case SSIF_IPMI_MULTIPART_WRITE_MIDDLE:
> > > +	case SSIF_IPMI_MULTIPART_WRITE_END:
> > > +		index = ssif_bmc->request.len - ssif_bmc->recv_len;
> > > +		if ((ssif_bmc->msg_idx - 1 + index) == ssif_msg_len(&ssif_bmc->request)) {
> > > +			/* PEC is not included */
> > > +			ssif_bmc->pec_support = false;
> > > +			ret = true;
> > > +			goto exit;
> > > +		}
> > > +
> > > +		if ((ssif_bmc->msg_idx - 1 + index) != (ssif_msg_len(&ssif_bmc->request) + 1)) {
> > > +			dev_err(&ssif_bmc->client->dev, "Error: Unexpected length received %d\n",
> > > +				ssif_msg_len(&ssif_bmc->request));
> > > +			ret = false;
> > > +			goto exit;
> > > +		}
> > > +
> > > +		/* PEC is included */
> > > +		ssif_bmc->pec_support = true;
> > > +		rpec = buf[ssif_bmc->msg_idx - 2 + index];
> > > +		addr = GET_8BIT_ADDR(ssif_bmc->client->addr);
> > > +		cpec = i2c_smbus_pec(cpec, &addr, 1);
> > > +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->smbus_cmd, 1);
> > > +		cpec = i2c_smbus_pec(cpec, &ssif_bmc->recv_len, 1);
> > 
> > Just curious, I'm not sure the client side PEC in the Linux driver has
> > ever been validated.  Have you tested both sides?
> > 
> 
> Yes, we found that request from host has an extra byte for PEC and that is
> why we added PEC support.
> 
> > > +		/* As SMBus specification does not allow the length
> > > +		 * (byte count) in the Write-Block protocol to be zero.
> > > +		 * Therefore, it is illegal to have the last Middle
> > > +		 * transaction in the sequence carry 32-byte and have
> > > +		 * a length of ‘0’ in the End transaction.
> > > +		 * But some users may try to use this way and we should
> > > +		 * prevent ssif_bmc driver broken in this case.
> > > +		 */
> > > +		if (ssif_bmc->recv_len != 0)
> > > +			cpec = i2c_smbus_pec(cpec, buf + 1 + index, ssif_bmc->recv_len);
> > > +
> > > +		if (rpec != cpec) {
> > > +			dev_err(&ssif_bmc->client->dev, "Bad PEC 0x%02x vs. 0x%02x\n", rpec, cpec);
> > > +			ret = false;
> > > +		}
> > > +
> > > +		break;
> > > +	default:
> > > +		/* Do not expect to go to this case */
> > > +		dev_err(&ssif_bmc->client->dev, "%s: Unexpected SMBus command 0x%x\n",
> > > +			__func__, ssif_bmc->smbus_cmd);
> > > +		ret = false;
> > > +		break;
> > > +	}
> > > +
> > > +exit:
> > > +	return ret;
> > > +}
> > > +
> > 
> > Just a nit, more a general coding style comment.  It's almost always a
> > bad idea to put a negative (unsupported) into a check function.  You
> > often end up with something like:
> > 
> > 	if (!unsupported_smbus_cmd(c))....
> > 
> > which looks a little strange.  Double negatives can make it hard to
> > follow and lead to mistakes.  This one isn't too bad, but sometimes it
> > can be.  It's better to do:
> > 
> > 	if (supported_smbus_cmd(c))....
> > or
> > 	if (!supported_smbus_cmd(c))....
> > 
> > 
> 
> Thanks, Corey. I'll try to refactor this part in next version.
> 
> > > +static bool unsupported_smbus_cmd(u8 cmd)
> > > +{
> > > +	if (cmd == SSIF_IPMI_SINGLEPART_READ ||
> > > +	    cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> > > +	    cmd == SSIF_IPMI_MULTIPART_WRITE_START ||
> > > +	    cmd == SSIF_IPMI_MULTIPART_WRITE_MIDDLE ||
> > > +	    cmd == SSIF_IPMI_MULTIPART_WRITE_END ||
> > > +	    cmd == SSIF_IPMI_MULTIPART_READ_START ||
> > > +	    cmd == SSIF_IPMI_MULTIPART_READ_MIDDLE)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void process_smbus_cmd(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	/* SMBUS command can vary (single or multi-part) */
> > > +	ssif_bmc->smbus_cmd = *val;
> > > +	ssif_bmc->msg_idx++;
> > > +
> > > +	if (unsupported_smbus_cmd(*val))
> > > +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown SMBus command");
> > > +
> > > +	if (*val == SSIF_IPMI_SINGLEPART_WRITE ||
> > > +	    *val == SSIF_IPMI_MULTIPART_WRITE_START) {
> > > +		/*
> > > +		 * The response maybe not come in-time, causing host SSIF driver
> > > +		 * to timeout and resend a new request. In such case check for
> > > +		 * pending response and clear it
> > > +		 */
> > > +		if (ssif_bmc->response_in_progress)
> > > +			complete_response(ssif_bmc);
> > > +	}
> > > +}
> > > +
> > > +static void on_read_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	if (ssif_bmc->state == SSIF_READY ||
> > > +	    ssif_bmc->state == SSIF_START ||
> > > +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> > > +	    ssif_bmc->state == SSIF_RES_SENDING) {
> > > +		ssif_bmc->state = SSIF_BAD_SMBUS;
> > > +		dev_warn(&ssif_bmc->client->dev,
> > > +			 "Warn: %s unexpected READ REQUESTED in state=%s\n",
> > > +			 __func__, state_to_string(ssif_bmc->state));
> > > +
> > > +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
> > > +		ssif_bmc->state = SSIF_RES_SENDING;
> > > +	}
> > > +
> > > +	ssif_bmc->msg_idx = 0;
> > > +	if (ssif_bmc->is_singlepart_read)
> > > +		*val = ssif_bmc->response.len;
> > > +	else
> > > +		set_multipart_response_buffer(ssif_bmc, val);
> > > +}
> > > +
> > > +static void on_read_processed_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	if (ssif_bmc->state == SSIF_READY ||
> > > +	    ssif_bmc->state == SSIF_START ||
> > > +	    ssif_bmc->state == SSIF_REQ_RECVING ||
> > > +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
> > > +		dev_warn(&ssif_bmc->client->dev,
> > > +			 "Warn: %s unexpected READ PROCESSED in state=%s\n",
> > > +			 __func__, state_to_string(ssif_bmc->state));
> > > +		ssif_bmc->state = SSIF_BAD_SMBUS;
> > > +	}
> > > +
> > > +	handle_read_processed(ssif_bmc, val);
> > > +}
> > > +
> > > +static void on_write_requested_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	ssif_bmc->msg_idx = 0;
> > > +
> > > +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_SMBUS_CMD) {
> > > +		ssif_bmc->state = SSIF_START;
> > > +
> > > +	} else if (ssif_bmc->state == SSIF_START ||
> > > +		   ssif_bmc->state == SSIF_REQ_RECVING ||
> > > +		   ssif_bmc->state == SSIF_RES_SENDING) {
> > > +		dev_warn(&ssif_bmc->client->dev,
> > > +			 "Warn: %s unexpected WRITE REQUEST in state=%s\n",
> > > +			 __func__, state_to_string(ssif_bmc->state));
> > > +		ssif_bmc->state = SSIF_BAD_SMBUS;
> > > +	}
> > > +}
> > > +
> > > +static void on_write_received_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	if (ssif_bmc->state == SSIF_READY || ssif_bmc->state == SSIF_RES_SENDING) {
> > > +		dev_warn(&ssif_bmc->client->dev,
> > > +			 "Warn: %s unexpected WRITE RECEIVED in state=%s\n",
> > > +			 __func__, state_to_string(ssif_bmc->state));
> > > +		ssif_bmc->state = SSIF_BAD_SMBUS;
> > > +	} else if (ssif_bmc->state == SSIF_START) {
> > > +		ssif_bmc->state = SSIF_SMBUS_CMD;
> > > +	} else if (ssif_bmc->state == SSIF_SMBUS_CMD) {
> > > +		ssif_bmc->state = SSIF_REQ_RECVING;
> > > +	}
> > > +
> > > +	/* This is response sending state */
> > > +	if (ssif_bmc->state == SSIF_REQ_RECVING)
> > > +		handle_write_received(ssif_bmc, val);
> > > +	else if (ssif_bmc->state == SSIF_SMBUS_CMD)
> > > +		process_smbus_cmd(ssif_bmc, val);
> > > +}
> > > +
> > > +static void on_stop_event(struct ssif_bmc_ctx *ssif_bmc, u8 *val)
> > > +{
> > > +	if (ssif_bmc->state == SSIF_READY ||
> > > +	    ssif_bmc->state == SSIF_START ||
> > > +	    ssif_bmc->state == SSIF_SMBUS_CMD) {
> > > +		dev_warn(&ssif_bmc->client->dev,
> > > +			 "Warn: %s unexpected SLAVE STOP in state=%s\n",
> > > +			 __func__, state_to_string(ssif_bmc->state));
> > > +
> > > +	} else if (ssif_bmc->state == SSIF_BAD_SMBUS) {
> > > +		dev_warn(&ssif_bmc->client->dev,
> > > +			 "Warn: %s received SLAVE STOP from bad state=%s\n",
> > > +			 __func__, state_to_string(ssif_bmc->state));
> > > +
> > > +	} else if (ssif_bmc->state == SSIF_REQ_RECVING) {
> > > +		/* A BMC that receives an invalid request drop the data for the write
> > > +		 * transaction and any further transactions (read or write) until
> > > +		 * the next valid read or write Start transaction is received
> > > +		 */
> > > +		if (!validate_request(ssif_bmc))
> > > +			dev_err(&ssif_bmc->client->dev, "Error: invalid pec\n");
> > > +		else if (ssif_bmc->smbus_cmd == SSIF_IPMI_SINGLEPART_WRITE ||
> > > +			 ssif_bmc->smbus_cmd == SSIF_IPMI_MULTIPART_WRITE_END)
> > > +			handle_request(ssif_bmc);
> > > +	}
> > > +
> > > +	ssif_bmc->state = SSIF_READY;
> > > +	/* Reset message index */
> > > +	ssif_bmc->msg_idx = 0;
> > > +}
> > > +
> > > +/*
> > > + * Callback function to handle I2C slave events
> > > + */
> > > +static int ssif_bmc_cb(struct i2c_client *client, enum i2c_slave_event event, u8 *val)
> > > +{
> > > +	unsigned long flags;
> > > +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> > > +	int ret = 0;
> > > +
> > > +	spin_lock_irqsave(&ssif_bmc->lock, flags);
> > > +
> > > +	switch (event) {
> > > +	case I2C_SLAVE_READ_REQUESTED:
> > > +		on_read_requested_event(ssif_bmc, val);
> > > +		break;
> > > +
> > > +	case I2C_SLAVE_WRITE_REQUESTED:
> > > +		on_write_requested_event(ssif_bmc, val);
> > > +		break;
> > > +
> > > +	case I2C_SLAVE_READ_PROCESSED:
> > > +		on_read_processed_event(ssif_bmc, val);
> > > +		break;
> > > +
> > > +	case I2C_SLAVE_WRITE_RECEIVED:
> > > +		on_write_received_event(ssif_bmc, val);
> > > +		break;
> > > +
> > > +	case I2C_SLAVE_STOP:
> > > +		on_stop_event(ssif_bmc, val);
> > > +		break;
> > > +
> > > +	default:
> > > +		dev_warn(&ssif_bmc->client->dev, "Warn: Unknown i2c slave event\n");
> > > +		break;
> > > +	}
> > > +
> > > +	if (ssif_bmc->busy)
> > > +		ret = -EBUSY;
> > > +
> > > +	spin_unlock_irqrestore(&ssif_bmc->lock, flags);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ssif_bmc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> > > +{
> > > +	struct ssif_bmc_ctx *ssif_bmc;
> > > +	int ret;
> > > +
> > > +	ssif_bmc = devm_kzalloc(&client->dev, sizeof(*ssif_bmc), GFP_KERNEL);
> > > +	if (!ssif_bmc)
> > > +		return -ENOMEM;
> > > +
> > > +	spin_lock_init(&ssif_bmc->lock);
> > > +
> > > +	init_waitqueue_head(&ssif_bmc->wait_queue);
> > > +	ssif_bmc->request_available = false;
> > > +	ssif_bmc->response_in_progress = false;
> > > +	ssif_bmc->busy = false;
> > > +	ssif_bmc->response_timer_inited = false;
> > > +
> > > +	/* Register misc device interface */
> > > +	ssif_bmc->miscdev.minor = MISC_DYNAMIC_MINOR;
> > > +	ssif_bmc->miscdev.name = DEVICE_NAME;
> > > +	ssif_bmc->miscdev.fops = &ssif_bmc_fops;
> > > +	ssif_bmc->miscdev.parent = &client->dev;
> > > +	ret = misc_register(&ssif_bmc->miscdev);
> > > +	if (ret)
> > > +		goto out;
> > > +
> > > +	ssif_bmc->client = client;
> > > +	ssif_bmc->client->flags |= I2C_CLIENT_SLAVE;
> > > +
> > > +	/* Register I2C slave */
> > > +	i2c_set_clientdata(client, ssif_bmc);
> > > +	ret = i2c_slave_register(client, ssif_bmc_cb);
> > > +	if (ret) {
> > > +		misc_deregister(&ssif_bmc->miscdev);
> > > +		goto out;
> > > +	}
> > > +
> > > +	return 0;
> > > +out:
> > > +	devm_kfree(&client->dev, ssif_bmc);
> > > +	return ret;
> > > +}
> > > +
> > > +static int ssif_bmc_remove(struct i2c_client *client)
> > > +{
> > > +	struct ssif_bmc_ctx *ssif_bmc = i2c_get_clientdata(client);
> > > +
> > > +	i2c_slave_unregister(client);
> > > +	misc_deregister(&ssif_bmc->miscdev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static const struct of_device_id ssif_bmc_match[] = {
> > > +	{ .compatible = "ampere,ssif-bmc" },
> > > +	{ },
> > > +};
> > > +
> > > +static const struct i2c_device_id ssif_bmc_id[] = {
> > > +	{ DEVICE_NAME, 0 },
> > > +	{ },
> > > +};
> > > +
> > > +MODULE_DEVICE_TABLE(i2c, ssif_bmc_id);
> > > +
> > > +static struct i2c_driver ssif_bmc_driver = {
> > > +	.driver         = {
> > > +		.name           = DEVICE_NAME,
> > > +		.of_match_table = ssif_bmc_match,
> > > +	},
> > > +	.probe          = ssif_bmc_probe,
> > > +	.remove         = ssif_bmc_remove,
> > > +	.id_table       = ssif_bmc_id,
> > > +};
> > > +
> > > +module_i2c_driver(ssif_bmc_driver);
> > > +
> > > +MODULE_AUTHOR("Quan Nguyen <quan@os.amperecomputing.com>");
> > > +MODULE_AUTHOR("Chuong Tran <chuong@os.amperecomputing.com>");
> > > +MODULE_DESCRIPTION("Linux device driver of the BMC IPMI SSIF interface.");
> > > +MODULE_LICENSE("GPL");
> > > diff --git a/drivers/char/ipmi/ssif_bmc.h b/drivers/char/ipmi/ssif_bmc.h
> > > new file mode 100644
> > > index 000000000000..9a26f3c252cc
> > > --- /dev/null
> > > +++ b/drivers/char/ipmi/ssif_bmc.h
> > > @@ -0,0 +1,102 @@
> > > +/* SPDX-License-Identifier: GPL-2.0+ */
> > > +/*
> > > + * The driver for BMC side of SSIF interface
> > > + *
> > > + * Copyright (c) 2022, Ampere Computing LLC
> > > + *
> > > + */
> > > +#ifndef __SSIF_BMC_H__
> > > +#define __SSIF_BMC_H__
> > > +
> > > +#define DEVICE_NAME				"ipmi-ssif-host"
> > > +
> > > +#define GET_8BIT_ADDR(addr_7bit)		(((addr_7bit) << 1) & 0xff)
> > > +
> > > +/* A standard SMBus Transaction is limited to 32 data bytes */
> > > +#define MAX_PAYLOAD_PER_TRANSACTION		32
> > > +
> > > +#define MAX_IPMI_DATA_PER_START_TRANSACTION	30
> > > +#define MAX_IPMI_DATA_PER_MIDDLE_TRANSACTION	31
> > > +
> > > +#define SSIF_IPMI_SINGLEPART_WRITE		0x2
> > > +#define SSIF_IPMI_SINGLEPART_READ		0x3
> > > +#define SSIF_IPMI_MULTIPART_WRITE_START		0x6
> > > +#define SSIF_IPMI_MULTIPART_WRITE_MIDDLE	0x7
> > > +#define SSIF_IPMI_MULTIPART_WRITE_END		0x8
> > > +#define SSIF_IPMI_MULTIPART_READ_START		0x3
> > > +#define SSIF_IPMI_MULTIPART_READ_MIDDLE		0x9
> > > +
> > > +#define MSG_PAYLOAD_LEN_MAX			252
> > > +/*
> > > + * IPMI 2.0 Spec, section 12.7 SSIF Timing,
> > > + * Request-to-Response Time is T6max(250ms) - T1max(20ms) - 3ms = 227ms
> > > + * Recover ssif_bmc from busy state if it takes upto 500ms
> > > + */
> > > +#define RESPONSE_TIMEOUT			500 /* ms */
> > > +
> > > +struct ssif_msg {
> > > +	u8 len;
> > > +	u8 netfn_lun;
> > > +	u8 cmd;
> > > +	u8 payload[MSG_PAYLOAD_LEN_MAX];
> > > +} __packed;
> > > +
> > > +static inline u32 ssif_msg_len(struct ssif_msg *ssif_msg)
> > > +{
> > > +	return ssif_msg->len + 1;
> > > +}
> > > +
> > > +/*
> > > + * SSIF internal states:
> > > + *   SSIF_READY         0x00 : Ready state
> > > + *   SSIF_START         0x01 : Start smbus transaction
> > > + *   SSIF_SMBUS_CMD     0x02 : Received SMBus command
> > > + *   SSIF_REQ_RECVING   0x03 : Receiving request
> > > + *   SSIF_RES_SENDING   0x04 : Sending response
> > > + *   SSIF_BAD_SMBUS     0x05 : Bad SMbus transaction
> > > + */
> > > +enum ssif_state {
> > > +	SSIF_READY,
> > > +	SSIF_START,
> > > +	SSIF_SMBUS_CMD,
> > > +	SSIF_REQ_RECVING,
> > > +	SSIF_RES_SENDING,
> > > +	SSIF_BAD_SMBUS,
> > > +	SSIF_STATE_MAX
> > > +};
> > > +
> > > +struct ssif_bmc_ctx {
> > > +	struct i2c_client	*client;
> > > +	struct miscdevice	miscdev;
> > > +	size_t			msg_idx;
> > > +	bool			pec_support;
> > > +	/* ssif bmc spinlock */
> > > +	spinlock_t		lock;
> > > +	wait_queue_head_t	wait_queue;
> > > +	u8			running;
> > > +	enum ssif_state		state;
> > > +	u8			smbus_cmd;
> > > +	/* Timeout waiting for response */
> > > +	struct timer_list	response_timer;
> > > +	bool                    response_timer_inited;
> > > +	/* Flag to identify a Multi-part Read Transaction */
> > > +	bool			is_singlepart_read;
> > > +	u8			nbytes_processed;
> > > +	u8			remain_len;
> > > +	u8			recv_len;
> > > +	/* Block Number of a Multi-part Read Transaction */
> > > +	u8			block_num;
> > > +	bool			request_available;
> > > +	bool			response_in_progress;
> > > +	bool			busy;
> > > +	/* Response buffer for Multi-part Read Transaction */
> > > +	u8			response_buf[MAX_PAYLOAD_PER_TRANSACTION];
> > > +	struct ssif_msg		response;
> > > +	struct ssif_msg		request;
> > > +};
> > > +
> > > +static inline struct ssif_bmc_ctx *to_ssif_bmc(struct file *file)
> > > +{
> > > +	return container_of(file->private_data, struct ssif_bmc_ctx, miscdev);
> > > +}
> > > +#endif /* __SSIF_BMC_H__ */
> > > -- 
> > > 2.35.1
> > > 
> > > 
