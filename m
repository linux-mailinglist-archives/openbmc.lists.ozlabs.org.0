Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C6E519EEA
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 14:07:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KtbDB3v3Nz3bpD
	for <lists+openbmc@lfdr.de>; Wed,  4 May 2022 22:07:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZhzXCEkM;
	dkim-atps=neutral
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::835;
 helo=mail-qt1-x835.google.com; envelope-from=tcminyard@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZhzXCEkM; dkim-atps=neutral
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KtbCj0Pwtz3bbj;
 Wed,  4 May 2022 22:06:39 +1000 (AEST)
Received: by mail-qt1-x835.google.com with SMTP id fu47so648789qtb.5;
 Wed, 04 May 2022 05:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+WNZryBXL+g7kwNzKGyTKWK4wg/wzwMgT6OB9tUEVx4=;
 b=ZhzXCEkMq4XwxySq3BgrlTremloLuIKnLA4pTWCqSN9GHXJ7dLD8mUJk/a6Cx4DV9W
 qtBExIMVKBAmXh6F1zj87sqgxLJJoNG2txnzswjsQGHmgWu/KYeYWE6K5H9gp7SW1sI5
 FvlrNc8ComRabkEV3E0joBA8MMxDscVIJoHVfHhOSci22mtwHPfELk8iLcRGDJ15ELIO
 QV/ET9LIWtE+LIp4kymM9EWIX3H72WMXcj5bRrb0wTFn5gkJ4iPpugvtCjMT928AliNZ
 7ElEpkBUxqZBip8N0hWXNku1ShOJ7TwDuPgcw64PDBIcHnngwNTweMqLJopbxEcd/iQG
 uu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=+WNZryBXL+g7kwNzKGyTKWK4wg/wzwMgT6OB9tUEVx4=;
 b=o7/xVJWtHo3p25rFiJIqfp00k2KXjj9Hvt9jPTOkir2GxccHhcAZ0XI5k0J8wdnD+y
 Il4rR6XDEG/2PvvRzFNQzQ2k5NkevdgTu/t4LbXnaUpm3frGClkr3bZiQYi8lguGTomk
 4/0wLJxYomC88PuyfePUOGd3tz0F1De/UmcUgENtrOW6utGkBuRvC6FaDCfjEv8iPpXZ
 Py/0875CkEHEVnKcyd2RKxFA9GRipzfDVNDoYQyASVsRhuj7LOIh44xUd8kPKAfXOH+f
 MDkFloxi62+IIldSTwOEtcXl8N2HYvvxPygmdDbFZB+j9iQrncNtcoRQrk76EEBN3dW5
 lmZQ==
X-Gm-Message-State: AOAM532GpY5u4Mxq8n1X7NcRcVkuhZyiOaDh8o3HMqU/MBGJoo8PYMy5
 kZIIvEKqSiYW+EyXYVFUUA==
X-Google-Smtp-Source: ABdhPJy8E2ZGhOMqaubc9bI3GOFs28UeBhEN5Ik/qSGSpbMeojwEWqvAJa0IzwkfLKv2xoNBPuJkig==
X-Received: by 2002:a05:622a:1ba7:b0:2f3:a08e:7c11 with SMTP id
 bp39-20020a05622a1ba700b002f3a08e7c11mr15849578qtb.10.1651665993525; 
 Wed, 04 May 2022 05:06:33 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 l184-20020a3789c1000000b0069fc13ce22esm7512348qkd.95.2022.05.04.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:06:33 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:149c:2dc6:c0ab:4341])
 by serve.minyard.net (Postfix) with ESMTPSA id 322621800BD;
 Wed,  4 May 2022 12:06:32 +0000 (UTC)
Date: Wed, 4 May 2022 07:06:31 -0500
From: Corey Minyard <minyard@acm.org>
To: Quan Nguyen <quan@os.amperecomputing.com>
Subject: Re: [Openipmi-developer] [PATCH v7 1/3] ipmi: ssif_bmc: Add SSIF BMC
 driver
Message-ID: <20220504120631.GE3767252@minyard.net>
References: <20220422040803.2524940-1-quan@os.amperecomputing.com>
 <20220422040803.2524940-2-quan@os.amperecomputing.com>
 <20220423015119.GE426325@minyard.net>
 <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec7b86ec-827f-da64-8fd2-eae09f802694@os.amperecomputing.com>
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
 Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Open Source Submission <patches@amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Wed, May 04, 2022 at 01:45:03PM +0700, Quan Nguyen via Openipmi-developer wrote:
> > 
> > I seem to remember mentioning this before, but there is no reason to
> > pack the structures below.
> > 
> 
> The packed structure is because we want to pick the len directly from user
> space without worry about the padding byte.
> 
> As we plan not to use the .h file in next version, I still would like to use
> packed structure internally inside ssif_bmc.c file.

Packed doesn't matter for the userspace API.  If you look at other
structures in the userspace API, they are not packed, either.  The
compiler will do the right thing on both ends.

> 
> > And second, the following is a userspace API structures, so it needs to
> > be in its own file in include/uapi/linux, along with any supporting
> > things that users will need to use.  And your userspace code should be
> > using that file.
> > 
> 
> Meantime, I'd like not to use .h as I see there is no demand for sharing the
> data structure between kernel and user space yet. But we may do it in the
> future.

If you have a userspace API, it needs to be in include/uapi/linux.
You may not be the only user of this code.  In fact, you probably won't
be.  You need to have a .h with the structures in it, you don't want the
same structure in two places if you can help it.

> 
> > > +struct ssif_msg {
> > > +	u8 len;
> > 
> > Just to be 100% safe, it might be better to use a u16 on this.  The spec
> > sort of limits this to 255 bytes, but it also sort of leaves it open to
> > be larger.
> > 
> Yes, u8 only limited to 255 bytes and there is no space for future grow.

Please make it a unsigned int for the length and __u8 for the data to
give necessary flexibility.

Thanks,

-corey

> 
> > > +	u8 payload[MSG_PAYLOAD_LEN_MAX];
> > > +} __packed;
> > > +
> > > +struct ssif_part_buffer {
> > > +	u8 address;
> > > +	u8 smbus_cmd;
> > > +	u8 length;
> > > +	u8 payload[MAX_PAYLOAD_PER_TRANSACTION];
> > > +	u8 pec;
> > > +	u8 index;
> > > +} __packed;
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
> > > +	SSIF_ABORTING,
> > > +	SSIF_STATE_MAX
> > > +};
> > > +
> > > +struct ssif_bmc_ctx {
> > > +	struct i2c_client	*client;
> > > +	struct miscdevice	miscdev;
> > > +	int			msg_idx;
> > > +	bool			pec_support;
> > > +	/* ssif bmc spinlock */
> > > +	spinlock_t		lock;
> > > +	wait_queue_head_t	wait_queue;
> > > +	u8			running;
> > > +	enum ssif_state		state;
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
> > > +	bool			aborting;
> > > +	/* Buffer for SSIF Transaction part*/
> > > +	struct ssif_part_buffer	part_buf;
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
> 
> 
> 
> _______________________________________________
> Openipmi-developer mailing list
> Openipmi-developer@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/openipmi-developer
