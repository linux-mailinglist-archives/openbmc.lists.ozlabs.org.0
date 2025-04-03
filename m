Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B13D2A7AF28
	for <lists+openbmc@lfdr.de>; Thu,  3 Apr 2025 22:43:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZTDGN31zSz30P3
	for <lists+openbmc@lfdr.de>; Fri,  4 Apr 2025 07:43:24 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743712997;
	cv=none; b=Db3Fyfhj1FJ1NHZ/gFJWa5bfSWge89E9UO6ennXxlELYqHMx/8ZCiJT9BWajR6x9AKi3d4Qm81IvX/SPM/70buS9g71QFAAXV079mlUEhIBj2T6BQAVxf3eMC1QZqWq9Ue0i5eHGLySyjwAjTXS/BGsmPyz79+JHlOK1VdYSGXxnnRPEdbxJEPR1J4d8ae1YutnuXX1KIt5rm08lXRpQh/Tp907J9t8S46ylXkiGbWm/1FSCOx9KDvsBq8q/HD2DyqPH5DCAlBRrz6Kd2gmFneiRn4faAIQRhVyRRtdOTtIXFwTsGll/uPUwY27jidYVuI5v8VB2QW3FYJyrsIyZXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743712997; c=relaxed/relaxed;
	bh=G6icddSlCuKj5TpsX7xu2pqc+06t04BKolGjlj7WZ4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9M8q8Lx32yfPLYDFs8Ro2BqViqKjdiP41Jw7wkyrMrxtyyEMPA1GFPJmYqlBPK3bCc2ZEC2FrunahBL0431U/Pd3Ueazh6NEowWZlZ2sN1nFmLq/aiFPCkUN05kdFYh/Zmplge7rq9VbTQwRazJoWpxy1BdtqVo83bhv7mvP8SxPTL/OiEM8UncSZmcgXHO/QiSNsI3ZcZsaXNRnWVVasjoqWeGEwg9X6s+QGoNx0AnzqgZrzgcNBLolk77x4Qu40ujQMrqJtLKLCgLuV1uJ385nVx6DtAcbxRuV9N8q8qxyoZ9BnslAxx5zzh1sUNEgpAdtvWL3cSKzVamtdYWMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RPQVjAej; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RPQVjAej;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12b; helo=mail-lf1-x12b.google.com; envelope-from=fercerpav@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZTDGD2k3bz2yYy
	for <openbmc@lists.ozlabs.org>; Fri,  4 Apr 2025 07:43:15 +1100 (AEDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5499614d3d2so1484675e87.3
        for <openbmc@lists.ozlabs.org>; Thu, 03 Apr 2025 13:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743712992; x=1744317792; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G6icddSlCuKj5TpsX7xu2pqc+06t04BKolGjlj7WZ4k=;
        b=RPQVjAejKB/YjNpfrLa4FXNnsWycj9e27a1J/jthUrmGBBzjSbIlvjas0AnD/L4Whe
         QYqoDk+8eq4r0c8rVb5pdRSLqrETVa+YB2Gm0wk58EFGA+ZNxz3jS7VyAmKE++t0lBDv
         PpjTp2vXppc8xl7JUHzuKKjrY/3z5h3xG0ENIR2F2t4RP9NLmm0aje0T4bf8gCjf3PE2
         mTY70wkUb6GgiI8zi/LCkk92CpPmxPkiDtcSAgnmeGugH1vwxt7lk3dlZK68/yVdzvLn
         MZzDXXiD5ILFooQ8mFlqrTizRDX5kgEiqI01YCnAf+R6l2DyzjevSP5Hohc6CvpQi7Tr
         MwRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743712992; x=1744317792;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G6icddSlCuKj5TpsX7xu2pqc+06t04BKolGjlj7WZ4k=;
        b=Zy5pgQVzk6bSnePg9FVOYG2UJZoRtc7f3ac9mKX5kTBlPdwJDUYeuMONCvomeBnTLe
         5WAbvTdfyWlPXwDXq0a+JlhPI9VHTvDNnfyIpiaOT//cW2MQ24tDgnl/vIsgtiS1014X
         fIfbU0yqZ6haSXqzNh8v8V1+FeFS4wpv+AhX3WbxZbt9U5lNHLt1XRsA0+e+IgWAfJhZ
         R4l4URLpzCds5qUyE9lr3n8jlEAxvCPUTvy6l3qhuo/ETXplRznBAU9lOM+Uar3tdeQe
         m3aomsMuXXIW1twMn1AgSSrWaTbCICXAqhVqfItkkB/AQH54Q2Ewp+XPD7/xxd3gWxFw
         VBjQ==
X-Gm-Message-State: AOJu0YyMuUqPMaaBOu2G5zamAKKlWHB38eZXLQGobGu0cD49iWvxoqeC
	jLvBKDsCoue1tbYmTuxhjximXbNqeKDkonxW/HxzuUMLsdQeClnF
X-Gm-Gg: ASbGncsWdSLuEWnaCrMsqsmxsS/ESg4D/zfw5NFs2q0HraXzpMtxAj4k/g/dsmuLs6N
	z8Pa7cqoAe7MHDF64DwkgkxP7xaGVaeBe5/d1UdJ7hzHDI5l/LDeGZNvKYqEupJ5ZBd56LwdGXi
	dSNSJxUNw4MlXB0BXgIxyfb4ieqXBAoXB0h2/ycC1Y0uhUv4/y0wM2AgmN9y/zwsTWbhMBn/M9p
	OJbOXJo7S6db/cweCTG0SbscqIl+uEXh+RlueMWNFbXnl9LLYEj56oQnKubOPGELEadMFNdHg3W
	1DbbOP8oherLlTSTJYgQiYbL9AwAs8FnY8ktTIBs4YNi8H+E8FhC4FQqwVo=
X-Google-Smtp-Source: AGHT+IGpBAo6Aws3SYHxANg2SfZhYZKWR6V55K3u6y+lLV3edCEtuq1hLMQtlGppe7wIQhced082RA==
X-Received: by 2002:a05:6512:114f:b0:549:883f:665b with SMTP id 2adb3069b0e04-54c232fa7acmr26227e87.34.1743712991989;
        Thu, 03 Apr 2025 13:43:11 -0700 (PDT)
Received: from home.paul.comp (paulfertser.info. [2001:470:26:54b:226:9eff:fe70:80c2])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54c1e635c46sm251837e87.129.2025.04.03.13.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:43:11 -0700 (PDT)
Received: from home.paul.comp (home.paul.comp [IPv6:0:0:0:0:0:0:0:1])
	by home.paul.comp (8.15.2/8.15.2/Debian-22+deb11u3) with ESMTP id 533Kh7Wg002711;
	Thu, 3 Apr 2025 23:43:09 +0300
Received: (from paul@localhost)
	by home.paul.comp (8.15.2/8.15.2/Submit) id 533Kh7ut002710;
	Thu, 3 Apr 2025 23:43:07 +0300
Date: Thu, 3 Apr 2025 23:43:06 +0300
From: Paul Fertser <fercerpav@gmail.com>
To: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: Update on some maintainers / contributors.
Message-ID: <Z+7y2oCR9xxVxDyF@home.paul.comp>
References: <ZyMIJfBoYDPeJhxK@heinlein.vulture-banana.ts.net>
 <Z-6jiKlhgkOStFZp@heinlein>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-6jiKlhgkOStFZp@heinlein>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Hello Patrick,

On Thu, Apr 03, 2025 at 11:04:40AM -0400, Patrick Williams wrote:
> The Linux Foundation made a clarifying post on this situation[1].
> 
> [1]: https://www.linuxfoundation.org/blog/navigating-global-regulations-and-open-source-us-ofac-sanctions

Kudos to the Linux Foundation lawyers for this prompt,
well-thought-out and, most importantly, directly applicable advice.

For those who get a little bit sea-sick reading legalese I took the
liberty of extracting what I found to be the most relevant to the
OpenBMC community:

"
developers[...] need to be cautious about who you interact with and
where your contributions come from.
[...]
Specially Designated Nationals and Blocked Persons ("SDN") List. OFAC
updates this list regularly, adding or removing names as global
situations change.
[...]
Key Points for Developers
[...]
you should consult your legal counsel immediately
[...]
1. OFAC's SDN "List" Is Not Enough
[...]
First there's the 50% percent rule if an entity is 50% or more owned
directly or indirectly by one or more SDNs. That requires identifying
who owns an entity, and (in many cases) who also owns that entity, up
until all owners are identified. Second, some sanctions apply to
entire countries (e.g. Iran), regions (e.g., the Crimea region of
Ukraine), or governments (e.g., the Government of
Venezuela)[...]. Additionally, the SDN List is constantly
changing. Just because an individual or entity is not on the SDN List
today does not mean they, or their owner, will not be added
tomorrow.
[...]
3. Avoid Two-Way Engagement
[...] help improve a patch or modify code would likely cross the line.
[...]
5. Avoid Indirect Contributions
[...]
seek legal advice early to avoid compliance issues.[...] By staying
aware and proactive, you can contribute to open source confidently

"

HTH
