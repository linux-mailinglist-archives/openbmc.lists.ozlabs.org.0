Return-Path: <openbmc+bounces-749-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3C8BE5B28
	for <lists+openbmc@lfdr.de>; Fri, 17 Oct 2025 00:36:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnjV04j0Xz3cZM;
	Fri, 17 Oct 2025 09:36:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760631128;
	cv=none; b=cE8DFcouD1swSTtyc41LBt8go5saPC3dl6mb28f8QuL9BrcC6ANIxHbo39y8dHvhAHVXAehFWakYK+4LWjtWSpkZH/sUr3leFNhiU8345Jbx6vZbvI145ThRXyF/dj42U47FFK7tKAv7MOyBbj88zHUURluaRLDqcx9dnR90E6tDx4WCG/wx/5UNe4hd1reLxqJkWvEXHKYZqNHKDxJl70itjRmWhUn4ZQdPMhJmDy+4O4apn8zVt0DoC46R2wBYPi1YLFN07HDDI00o6iC0XoUG/Dt8IdkXbsj04qg0Om70Dh/f4xE6daLR/pvC2uVg+bKWnZRSWuDvIeKTZ0lpiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760631128; c=relaxed/relaxed;
	bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Kr/JzRTvJOXGupJzxJBOh6TzS+0kh2zRZtIENTgSPKzMjg/brTUc0QkxlvvYhZ6MobBPiecEUOZOfCn5J6/HXQXlFB/mvhMyQWDgeTmoAUBTz1iQllcwtrLl1UACZh61lkjxRG+/mz/k6lqp9etspMPrX738K2EDBHElP7lWb2gqNnd+IUnzHWsvvKg6JEGf8HGeve28uwxP/fLlbQmErYQM+gSlpKg8Wudk9m+wuKnblCIAPuchny9gsRLF1+ue9Fl6tfdEOYVUysKBUht8TnRpWxugvK5b0ID0wTThhvkVmiaHuu4lYFoRMmrwxOLsXhrF9wtY5rOXnqroz99ymg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zoj5S0Q3; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zoj5S0Q3; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zoj5S0Q3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Zoj5S0Q3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bmasney@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnXyt6qnQz3bW7
	for <openbmc@lists.ozlabs.org>; Fri, 17 Oct 2025 03:12:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
	b=Zoj5S0Q34VyOgIAaFvUyYnWRIZEMRtrLFuyN1Gd34QG03facRFo3xGS1rYDo7OR0307oOi
	+miaKSZ9PdLns5vY6LeimQDkbARcA9TqlC83WOIyX3O3FaEm5TYqR+UUHwMs8CCgf+oHk5
	4siVgUanGEJIuqnDYJqDR9VyYia8wWw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
	b=Zoj5S0Q34VyOgIAaFvUyYnWRIZEMRtrLFuyN1Gd34QG03facRFo3xGS1rYDo7OR0307oOi
	+miaKSZ9PdLns5vY6LeimQDkbARcA9TqlC83WOIyX3O3FaEm5TYqR+UUHwMs8CCgf+oHk5
	4siVgUanGEJIuqnDYJqDR9VyYia8wWw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-89c1IIkhPrWTDSfT-SfRFw-1; Thu, 16 Oct 2025 12:11:58 -0400
X-MC-Unique: 89c1IIkhPrWTDSfT-SfRFw-1
X-Mimecast-MFC-AGG-ID: 89c1IIkhPrWTDSfT-SfRFw_1760631117
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87bf4ed75beso38860596d6.3
        for <openbmc@lists.ozlabs.org>; Thu, 16 Oct 2025 09:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631117; x=1761235917;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACAqVbHWeoat6K3HL1ahrRzqT6qreY6/QV4aq1RfvOI=;
        b=O0JEqmtFqIIm1KkHD67vqqRP5DAIDgqFLQJLx9+Yz4RnzWSAqwJ3xm+pQEK1dt+Edo
         SR1Po/lEdD4SLso9yYPt0joxvX11Rla2D7+U5S1VuTnHn67JWfVNVRDKMDqK7+WzKD0+
         dtt3AYrsgvW7cDLrlq0lfMeyhAI0kOOWSa66yO/TOMf0G9uhtb8cGwN/XMRto8sNg1pp
         FMfCVkqizX18snO13C9+TfzKMtqnyhb1fATTsCkJI9JNLJwN8Oc9AtL8gEy2IXIaMx3L
         jxfsBulHa7KNCaMF4gUZVRBOlHTQoCSt0YJx5AfYsy8TPAqcMcmfqzsnIrzy5IkTKssd
         pPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNL5K73t4Hr4Uv6FERViFglHYbhpuJ5eWU3EjNj2/VjKZFelrUSZNekGLONG+yzwnXQyDa6NI5@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEkWiiydb+fpKweWihmV7Br00uHC8UuSAQQgNIUKjbIMndGkJj
	PdrIQIYwq1JtSHw061+wZmD3a+xRryzC3yqjJaLYNhsQvn7dqrb9Pu/wPbdREWgDJja40+zZkzC
	eWaRGjce8uh79xoFzY+lNu+81o/XZ8mKMDvNKduk7bRjSJd/RMyvMwu2uOXpN
X-Gm-Gg: ASbGncuzoWwHNqq2ha9KMHHuQbmdqe1O44qPro9tCa8ZBQIrLRTRSUumUpoJzfI/uIH
	sk/ZD66a4TYyJjHtxEeZo1g1E7swi7lSLpA0AFJvKDaOtkJIwaGnaZBTCJRlMS6X4TCDJw/wnfo
	nPdVueSMd+mytT9MvhSHYKUyCyMxUIgAfxi4DUkTBkaKJ9B323DEd3PCexBL483jfujG+ivp4BL
	J+si8aZdBNySvAwkINqZzreqx3hoZP3AqSLvMeDver3ytD2QJBOyWVTxGXc1GIKQS6mresFAk7K
	kWRK4itq2tQhS6NVMgYXbGWUr8e5TUt6SJgx4ZHWQwWtSg9JlyhJ3c+pKhGl30PwalcHmvRC8f2
	XNN7B2vGZfo+FtemDbCLwNizgB8tpL8YRfDTLqi7iGWDYWQY26ccDlANK3Rq8jQIHqA==
X-Received: by 2002:a05:6214:319a:b0:87c:20b5:6685 with SMTP id 6a1803df08f44-87c20b56795mr9221816d6.55.1760631116553;
        Thu, 16 Oct 2025 09:11:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3K3iFq5m/T2G5n5k1Ub/AwaYH7OwwIxLCZt5EEaLCKub8NnH0J3P6LhBuV98s17jbVOVRfA==
X-Received: by 2002:a05:6214:319a:b0:87c:20b5:6685 with SMTP id 6a1803df08f44-87c20b56795mr9221106d6.55.1760631116071;
        Thu, 16 Oct 2025 09:11:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b4608sm42179536d6.58.2025.10.16.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:11:55 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:11:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	Joel Stanley <joel@jms.id.au>, Maxime Ripard <mripard@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] peci: controller: peci-aspeed: convert from round_rate()
 to determine_rate()
Message-ID: <aPEZSY6RC-UVclxN@redhat.com>
References: <20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com>
 <aMatZAX6eFI1RmDH@redhat.com>
 <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
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
In-Reply-To: <28dc3bd8aeca7e3164747960747f75060c596704.camel@codeconstruct.com.au>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _6vAmTQw_1GOKF3bIeoqfGUO0qnKBPs-cvEl9Ubkdxo_1760631117
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Andrew and Iwona,

On Mon, Sep 15, 2025 at 02:36:48PM +0930, Andrew Jeffery wrote:
> Hi Brian,
> 
> On Sun, 2025-09-14 at 07:56 -0400, Brian Masney wrote:
> > Hi Iwona, Joel, and Andrew,
> > 
> > On Sun, Aug 10, 2025 at 06:21:51PM -0400, Brian Masney wrote:
> > > The round_rate() clk ops is deprecated, so migrate this driver from
> > > round_rate() to determine_rate() using the Coccinelle semantic patch
> > > appended to the "under-the-cut" portion of the patch.
> > > 
> > > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > 
> > Would it be possible to get this picked up for v6.18? I'd like to remove
> > this API from drivers/clk in v6.19.
> 
> My (strong) preference is that Iwona applies it, but I'll keep an eye
> out for any unusual delays.

This patch wasn't picked up for v6.18. Any chance this can get picked up
now for v6.19?

I'm hoping to get this merged so that we can remove the round_rate() clk
op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Thanks,

Brian


