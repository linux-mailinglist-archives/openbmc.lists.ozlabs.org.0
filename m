Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD56E305CE
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:31:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQP535b3zDqYP
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:31:37 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=amazon.com
 (client-ip=72.21.198.25; helo=smtp-fw-4101.amazon.com;
 envelope-from=prvs=046f45703=eduval@amazon.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=amazon.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amazon.com header.i=@amazon.com header.b="jcuObHOm"; 
 dkim-atps=neutral
Received: from smtp-fw-4101.amazon.com (smtp-fw-4101.amazon.com [72.21.198.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dv6l4fBKzDqBZ
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 14:02:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1559188943; x=1590724943;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=UkRYNR5hm0gc7X8fxqjNJQmr3n5Ab3tDm3l1W9pl4Bw=;
 b=jcuObHOmFidW+Zz7kg6SOLsEDDAPzasD6hcpo7ABXrvGLdo2MMhlVbup
 MJFJAq7eO8qOfusT1KMQn0z7JCzrcAOF7b8AlqGi9jtXNFGiDcHKgRhUP
 CFUDLRICCaE51IUxEp+lUoEjEo2vf1nUObqvVICaaTdbngYnSTveteS1X g=;
X-IronPort-AV: E=Sophos;i="5.60,529,1549929600"; d="scan'208";a="768214243"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2c-168cbb73.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 30 May 2019 04:02:19 +0000
Received: from EX13MTAUWB001.ant.amazon.com
 (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
 by email-inbound-relay-2c-168cbb73.us-west-2.amazon.com (Postfix) with ESMTPS
 id 0630FA2204; Thu, 30 May 2019 04:02:18 +0000 (UTC)
Received: from EX13D05UWB002.ant.amazon.com (10.43.161.50) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 May 2019 04:02:18 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX13D05UWB002.ant.amazon.com (10.43.161.50) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 May 2019 04:02:18 +0000
Received: from localhost (10.94.220.85) by mail-relay.amazon.com
 (10.43.61.243) with Microsoft SMTP Server id 15.0.1367.3 via Frontend
 Transport; Thu, 30 May 2019 04:02:17 +0000
Date: Wed, 29 May 2019 21:02:17 -0700
From: Eduardo Valentin <eduval@amazon.com>
To: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Subject: Re: [PATCH i2c/slave-mqueue v5] i2c: slave-mqueue: add a slave
 backend to receive and queue messages
Message-ID: <20190530040217.GB17772@u40b0340c692b58f6553c.ant.amazon.com>
References: <1524503192-4176-1-git-send-email-haiyue.wang@linux.intel.com>
 <20190523220345.GA3417@u40b0340c692b58f6553c.ant.amazon.com>
 <35a9d066-c732-cb00-04a5-438c948915ae@linux.intel.com>
 <20190524173353.GA6428@u40b0340c692b58f6553c.ant.amazon.com>
 <bf1e8f0b-5bd0-fb43-c19b-9487603b9ee3@linux.intel.com>
 <20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com>
 <75cb9514-bb3a-9c3b-05df-0c3517bd775a@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75cb9514-bb3a-9c3b-05df-0c3517bd775a@linux.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: Bulk
X-Mailman-Approved-At: Fri, 31 May 2019 10:25:30 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
Cc: jae.hyun.yoo@linux.intel.com, andriy.shevchenko@intel.com,
 wsa@the-dreams.de, openbmc@lists.ozlabs.org,
 Eduardo Valentin <eduval@amazon.com>, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

On Thu, May 30, 2019 at 09:33:34AM +0800, Wang, Haiyue wrote:
> 
> 在 2019-05-30 07:11, Eduardo Valentin 写道:
> >>>>>>+
> >>>>>>+	case I2C_SLAVE_WRITE_RECEIVED:
> >>>>>>+		if (msg->len < MQ_MSGBUF_SIZE) {
> >>>>>>+			msg->buf[msg->len++] = *val;
> >>>>>Do we need to lock the accesses to msg->buf? how about to msg->len?
> >>>this code goes access and modify data here, e.g. msg->len and msg->buf.
> >>>
> >>>On this case (I2C_SLAVE_WRITE_RECEIVED), this code wont protect access.
> >>>
> >>>This can cause concurrence issues if you receive an IRQ when the user
> >>>is on your bin_read().
> >>User will not touch 'msg = mq->curr;', just touch 'msg =
> >>&mq->queue[mq->out];'
> >What happens if mq->curr == mq->queue[mq->out]?
> >
> 1. The Read will check.
> 
> +	spin_lock_irqsave(&mq->lock, flags);
> +	if (mq->out != mq->in) {
> +		msg = &mq->queue[mq->out];
> 
> 2. Flush the oldeast message. ^_^
> 
> +	case I2C_SLAVE_STOP:
> +		if (unlikely(mq->truncated || msg->len < 2))
> +			break;
> +
> +		spin_lock(&mq->lock);
> +		mq->in = MQ_QUEUE_NEXT(mq->in);
> +		mq->curr = &mq->queue[mq->in];
> +		mq->curr->len = 0;
> +
> +		/* Flush the oldest message */
> +		if (mq->out == mq->in)
> +			mq->out = MQ_QUEUE_NEXT(mq->out);

Yeah, I see. We keep on dropping messages (old ones) when the queue is full...

> +		spin_unlock(&mq->lock);
> 

-- 
All the best,
Eduardo Valentin
