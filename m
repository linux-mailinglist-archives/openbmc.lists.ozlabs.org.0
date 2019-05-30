Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B0305CB
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 02:29:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45FQLy59zgzDqYY
	for <lists+openbmc@lfdr.de>; Fri, 31 May 2019 10:29:46 +1000 (AEST)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=haiyue.wang@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Dqw45bVHzDqDS
 for <openbmc@lists.ozlabs.org>; Thu, 30 May 2019 11:37:56 +1000 (AEST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 May 2019 18:37:53 -0700
X-ExtLoop1: 1
Received: from haiyuewa-mobl.ccr.corp.intel.com (HELO [10.67.64.79])
 ([10.67.64.79])
 by fmsmga008.fm.intel.com with ESMTP; 29 May 2019 18:37:51 -0700
Subject: Re: [PATCH i2c/slave-mqueue v5] i2c: slave-mqueue: add a slave
 backend to receive and queue messages
To: Eduardo Valentin <eduval@amazon.com>
References: <1524503192-4176-1-git-send-email-haiyue.wang@linux.intel.com>
 <20190523220345.GA3417@u40b0340c692b58f6553c.ant.amazon.com>
 <35a9d066-c732-cb00-04a5-438c948915ae@linux.intel.com>
 <20190524173353.GA6428@u40b0340c692b58f6553c.ant.amazon.com>
 <bf1e8f0b-5bd0-fb43-c19b-9487603b9ee3@linux.intel.com>
 <20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com>
From: "Wang, Haiyue" <haiyue.wang@linux.intel.com>
Message-ID: <a3830583-c8fb-1972-9d50-4e74c7f67f78@linux.intel.com>
Date: Thu, 30 May 2019 09:37:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com>
Content-Type: multipart/alternative;
 boundary="------------DD54736417F7B9ED905435B7"
X-Mailman-Approved-At: Fri, 31 May 2019 10:25:31 +1000
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
Cc: jae.hyun.yoo@linux.intel.com, andriy.shevchenko@intel.com,
 wsa@the-dreams.de, openbmc@lists.ozlabs.org, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, jarkko.nikula@linux.intel.com,
 linux-i2c@vger.kernel.org
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------DD54736417F7B9ED905435B7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2019-05-30 07:11, Eduardo Valentin 写道:
>>> this code goes access and modify data here, e.g. msg->len and msg->buf.
>>>
>>> On this case (I2C_SLAVE_WRITE_RECEIVED), this code wont protect access.
>>>
>>> This can cause concurrence issues if you receive an IRQ when the user
>>> is on your bin_read().
>> User will not touch 'msg = mq->curr;', just touch 'msg =
>> &mq->queue[mq->out];'
> What happens if mq->curr == mq->queue[mq->out]?
>

1. The Read will check.

+	spin_lock_irqsave(&mq->lock, flags);
+	if (mq->out != mq->in) {
+		msg = &mq->queue[mq->out];

2. Flush the oldeast message. ^_^

+	case I2C_SLAVE_STOP:
+		if (unlikely(mq->truncated || msg->len < 2))
+			break;
+
+		spin_lock(&mq->lock);
+		mq->in = MQ_QUEUE_NEXT(mq->in);
+		mq->curr = &mq->queue[mq->in];
+		mq->curr->len = 0;
+
+		/* Flush the oldest message */
+		if (mq->out == mq->in)
+			mq->out = MQ_QUEUE_NEXT(mq->out);
+		spin_unlock(&mq->lock);


--------------DD54736417F7B9ED905435B7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><br>
    </p>
    <div class="moz-cite-prefix">在 2019-05-30 07:11, Eduardo Valentin
      写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com">
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">this code goes access and modify data here, e.g. msg-&gt;len and msg-&gt;buf.

On this case (I2C_SLAVE_WRITE_RECEIVED), this code wont protect access.

This can cause concurrence issues if you receive an IRQ when the user
is on your bin_read().
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">User will not touch 'msg = mq-&gt;curr;', just touch 'msg =
&amp;mq-&gt;queue[mq-&gt;out];'
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What happens if mq-&gt;curr == mq-&gt;queue[mq-&gt;out]?

</pre>
    </blockquote>
    <br>
    <p>1. The Read will check.<br>
    </p>
    <pre class="moz-quote-pre" wrap="">+	spin_lock_irqsave(&amp;mq-&gt;lock, flags);
+	if (mq-&gt;out != mq-&gt;in) {
+		msg = &amp;mq-&gt;queue[mq-&gt;out];

2. Flush the oldeast message. ^_^

+	case I2C_SLAVE_STOP:
+		if (unlikely(mq-&gt;truncated || msg-&gt;len &lt; 2))
+			break;
+
+		spin_lock(&amp;mq-&gt;lock);
+		mq-&gt;in = MQ_QUEUE_NEXT(mq-&gt;in);
+		mq-&gt;curr = &amp;mq-&gt;queue[mq-&gt;in];
+		mq-&gt;curr-&gt;len = 0;
+
+		/* Flush the oldest message */
+		if (mq-&gt;out == mq-&gt;in)
+			mq-&gt;out = MQ_QUEUE_NEXT(mq-&gt;out);
+		spin_unlock(&amp;mq-&gt;lock);</pre>
    <blockquote type="cite"
      cite="mid:20190529231100.GA18339@u40b0340c692b58f6553c.ant.amazon.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------DD54736417F7B9ED905435B7--
