Return-Path: <openbmc+bounces-980-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BC6CAE618
	for <lists+openbmc@lfdr.de>; Tue, 09 Dec 2025 00:07:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dQHgb3rRCz2yDY;
	Tue, 09 Dec 2025 10:07:23 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765184806;
	cv=none; b=Q3SaaTZ382uMsOnSvKytMG+unXo/1qFOqRS6LOsZVs/lT18UJLxNXm5TxxYo0Yx97NPfdHy3Dw3cgYXlqLb3KxmaKQmMadsTvaL/Uvkzby/FMA8GsDQvFII56pz1WWvKgr+ZcrfMSaW1HGFSnF6FKAamBqB9+s5NM49uoxhbnyqfsRVSxdM/7+BRc4CIW7xcIMJv1KJXNBQvM9weNtsrXBGktInTryTSBlrEaxYwt/NjQoNwHuAhLgZy0DDyqITGg5v6Ta5cD2NSiHaRfAHyCiBY8fNpTpnauFiyPDUFbTcpYwVr1giBb64lDvs8vfSXLBNqjfGJ6zmiFwat4w4IVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765184806; c=relaxed/relaxed;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nFmSUOLSghL2bUzvXU9wzYovS7ayZIRNR5IFL52LwEG8sS8grT+ldXBVqZxXTWn5PhExu19xKbqsuRDWEvmzpMg8kGwkcSN6rGeQbfv3cW5IsHStdcBKPgvyhtkSId+hxdb5OmaQh2fi3Bij6/b7LhE05UdFxmdJbuDImnLhOycnBhnugeTMLT5tBwtYhKm23J3q4Mx7qH6KSv1QaTEVHcbfniAuaLZBB0ZnAB4Dx79jQqkTSsMq8jxxed3TGhSg5T5bR+rwfpZU6LnR9mKnWJESS2YgMJtco07KliXYXEur3Wf13ge+dxC9GIGTGvcMdp+J5EHY+cLUFZxPB2SvYw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1q4XB/Nl; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ytvdW7jN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1q4XB/Nl; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ytvdW7jN; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1q4XB/Nl;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ytvdW7jN;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1q4XB/Nl;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=ytvdW7jN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=tiwai@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPx1d0YqYz2yKp
	for <openbmc@lists.ozlabs.org>; Mon, 08 Dec 2025 20:06:44 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 940565BE9F;
	Mon,  8 Dec 2025 09:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765184801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=1q4XB/NlqyshiONdOX9hfb1mOHt6kWVTz4jdVlvVyJ2oABv8to3wYe9bYGSIGYIRL9TeiZ
	9YiEhvwgZB940ExRk/hTDCsV2vDWTrjCOk08DFRWhn6pUwwjOxqwUsWMAf3/4+Pw115ABI
	/EWTyIlfYpBV/fIgSykysE0SuSEJ4JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765184801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=ytvdW7jNBDJe2kkQ+8Lmguq/A4kIvPR8KWYSF1lhd+l2d6gVRPeU7QAZ5KY8OfSidrlidt
	xBx/U5MRxM0t+ABQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1765184801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=1q4XB/NlqyshiONdOX9hfb1mOHt6kWVTz4jdVlvVyJ2oABv8to3wYe9bYGSIGYIRL9TeiZ
	9YiEhvwgZB940ExRk/hTDCsV2vDWTrjCOk08DFRWhn6pUwwjOxqwUsWMAf3/4+Pw115ABI
	/EWTyIlfYpBV/fIgSykysE0SuSEJ4JY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1765184801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7HqtiahDXn2VN25ipfNfPWVxu+0LpLFpleJYNFMZQ=;
	b=ytvdW7jNBDJe2kkQ+8Lmguq/A4kIvPR8KWYSF1lhd+l2d6gVRPeU7QAZ5KY8OfSidrlidt
	xBx/U5MRxM0t+ABQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 03DCB3EA63;
	Mon,  8 Dec 2025 09:06:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id DDBVOCCVNmmuBgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 08 Dec 2025 09:06:40 +0000
Date: Mon, 08 Dec 2025 10:06:40 +0100
Message-ID: <87fr9luyu7.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Arnd Bergmann
 <arnd@arndb.de>,
	andrew.jones@linux.dev,
	linux-omap@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	linux-mips@vger.kernel.org,
	asahi@lists.linux.dev,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	chrome-platform@lists.linux.dev,
	Paul Cercueil <paul@crapouillou.net>,
	linux-stm32@st-md-mailman.stormreply.com,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	linux-gpio@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	linux-sh@vger.kernel.org,
	x86@kernel.org,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: Kconfig dangling references (BZ 216748)
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[26];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,arndb.de,linux.dev,lists.ozlabs.org,linux.intel.com,lists.linux.dev,lists.freedesktop.org,sys-base.io,crapouillou.net,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,pengutronix.de];
	R_RATELIMIT(0.00)[to_ip_from(RLdkcz77k7ty1a1n58a6bzpetp)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -1.80
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 08 Dec 2025 03:04:09 +0100,
Randy Dunlap wrote:
> 
> SND_SOC_AC97_BUS_NEW ---
> sound/soc/pxa/Kconfig:21:	select SND_SOC_AC97_BUS_NEW

This must be a bogus entry added in commit 1c8bc7b3de5e ("ASoC: pxa:
switch to new ac97 bus support"), which can be dropped.

> SND_SOC_CS35L56_CAL_SYSFS_COMMON ---
> sound/soc/codecs/Kconfig:920:	select SND_SOC_CS35L56_CAL_SYSFS_COMMON

The buggy commit was 32172cf3cb54 ("ASoC: cs35l56: Allow restoring
factory calibration through ALSA control").
This looks like a fallout at changing from sysfs to debugfs, so this
should be SND_SOC_CS35L56_CAL_DEBUGFS_COMMON instead.


thanks,

Takashi

