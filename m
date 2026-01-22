Return-Path: <openbmc+bounces-1271-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8A+TIQ0rcmmadwAAu9opvQ
	(envelope-from <openbmc+bounces-1271-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 14:50:05 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F896783E
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 14:50:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxj9g4LFtz2yFm;
	Fri, 23 Jan 2026 00:49:59 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::e2b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769089799;
	cv=pass; b=IDh9qBNcSOR8SkEsKhHK2sL8TY00wfTSpPBczdBaL4ffm9viAA/x64ndXL7VuHX0lCGtFcFl13Y68pRYbLAPe1ukrvBswSZ8C5l4aPrU2emKko+Ao77D68e83GwqwdHNtWmnFZ0nIJA2arYTtx5AYbQOwGF4Pzofb2OBqhErTbtO1amBmZcSm0y5pDGRqgXVkUSbAkY3lS1MOucBiG24oKW9HzwHPi+gFY711DV4BfHk/ZdUBLoPqsKw5onJpu+CtQPvFbQt5IPvNOaZbaLWxXbLep5BgMfACRvKy585ZHvk1vlZ63N8TAB52rzD3jeCoN7Rik1j9EXS240YeqinUQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769089799; c=relaxed/relaxed;
	bh=tmnh4OUlX1lNJQHZBezwpzBedAgZXlHsT1OdLRhUG+A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLTMGRZojyKw238Y7361fDYcOoYsCZEvicMIjsqjVRAMsVDcneLvjJtjhPFBqD+9j86IuF7ll7nIk/t9OgtJn/lj9U8SI9pnNDqV3wt/ZREaHDqi99BoK/rL2O7TEt4ecY58guYBoyGDoVRLzlgT1ND55q41A4XhJd4BPZG73mDjCBMNBsnFGyaOZCqC1iFyKbImPqkr5ntaPxg8+WGwbKzRCtKvyrlZ6/wOXUSMlypqx8LOSXunRXHJ5Lr/Cyfpakqb+ydfQh5W125H0AXoVWKZvhAFScm2cQSTmFIvQjlsUJTw+x06uaoF5FopJ03K4kdasdntN+SvOrcdZhvyQA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0+r3/rl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=W0+r3/rl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2b; helo=mail-vs1-xe2b.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxj9d2Dg2z2xl0
	for <openbmc@lists.ozlabs.org>; Fri, 23 Jan 2026 00:49:56 +1100 (AEDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-5efa6d5dbf5so285845137.1
        for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 05:49:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769089789; cv=none;
        d=google.com; s=arc-20240605;
        b=Vxm4X3LZaHlxaxW65cixRkVbgcJVEkG5JVlU6NFCb3QRt7YgOMJkgcT48kXZtDT2nZ
         8WPynuSiicUXzwYHshfn1XUsaPUUjWwg5Bf57KIfAK+PX/oIQJrvQzIx7vXDcQx655d7
         WgGMJ3AQjp2xDHW3WjrByucY6dbOrAnusBvt4+HK2rRRxW/FvV8TYZ6EkTyqgxVOQkNL
         /goNfk3DmKrHq0e9RdqIBYPW7DrrbCId95hHNXHhrLojC4asLwEaP8Gtaz7zdEqRw0g6
         f3NRFa1nBCSkg4OCH8SNhPrZB/IY7EikToBi5M+FmF+VGo/UtGIe6uAPiXmy/X33xbnP
         5fEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tmnh4OUlX1lNJQHZBezwpzBedAgZXlHsT1OdLRhUG+A=;
        fh=87i4nV4cGNk+IOvBXRktVJEdHDkzszfj4Xlwyl0ZQSs=;
        b=Kqkau7PNEVX/oO9HoXAZwutupLEvb6rLPF/Ty0707H79VxDAENHWfDyauwMoKJenBY
         YnKD2tb4kpSPCv0nlWHwCVEXGAbI7K40/T1OqrxvvtZ+RLMFMrsmXv1AyCJlclnDyxjJ
         fhWzRl2LR8GOF/0D47ApT7ZngHU39I9vfrJ7nXF9H5t0Ddx6gQqCnDJ8CqxP8CRm8eCp
         UIqlPTgJiINqvvo7do0fUGRkkr8u2c6ITLamfMcl3kZJliGU4dOHoZhc+CivLcjCg5UU
         cgFeSQhVHanCpSNC58fhWC2YAOfFyZPJUvOsmpfMy33v0u6fbw91r+HWhHKr/vQ3wjyn
         dZLQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769089789; x=1769694589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tmnh4OUlX1lNJQHZBezwpzBedAgZXlHsT1OdLRhUG+A=;
        b=W0+r3/rluYGDPt8QNAxgjqmLBeDWjtWAwVrbipwZ6f81E9j464612sf6Ehok2SgT4o
         2KRaL2q0hjXVDEphAQpRDH97zCBT3SGTvtmTipHCIzIhVAiTK0AsiCrR8LTC2rcVBqW3
         Z0Yelj00titq+G712tANIxZKYyBfV1xJbPckS2xtIXzzqnDyZth8D8aymeTls2B2KtEH
         yAsgJ8kCcvTsHfHIuJifJwm4NhoKDTQ7CaX2j2EIoClEzV3EhHt8WphSLjAdc08SQdeq
         PwT89/3xnc2OmzrB7ZYp7t6jIT2nN6oq1WtaualbJQKCnHcXZ4W0Ry95Sf9NYAy9+w1r
         tj+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769089789; x=1769694589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmnh4OUlX1lNJQHZBezwpzBedAgZXlHsT1OdLRhUG+A=;
        b=xS7KeA9WQfRtdqd5HnD8EhlKkTpLth2M4Unfq2m+TVHmzqe/RDavuAoyu5bvsjrXci
         c/TznxGDOKkbCu+Tci4xsn+Nlr9VVVeMdsnVtEWwOn5pz16koK/NFdu9amxxoKL9PMtH
         DvOBJbop7D0LBsUUAXT1dnL+Bk9SYMiSlgpiJ/k/z1q5oEmel3OfPQ7Z9HiKRgXeN50X
         nkODlF2mf9nUkqoBp3WNbCuH5gGMZImYM3pwEfrkCqm0Gt15Ed+xUbVIM3fT0aPpqLJl
         EPvTkdKrxzXzHLR2hEeRmqLKOMPOG0g+GNug5NapgB9ffmLKW6bS0sTtwH62YVgPCzdJ
         C2gg==
X-Gm-Message-State: AOJu0YwOcVWKY51WSMokst8FExTXf70+3FhdChxgDXOIwecDHOe5hCn/
	E0StCRFo/pHjaPXMEP2N11mEOQJ/F5TQVxqJq3Ez3BKZQ1IYWW7HoJklfP9148frmGBZu2ZJiwX
	gJwQMYcroLEvdvy4lIW/glSMcN2L4FmA=
X-Gm-Gg: AZuq6aI9tWh9pQAOealTusU9MgH053CnEfKxcQNWIbRNHZZhWMf58AUDzRuIaBHlqsH
	4pXM3JRmiiKMgiSPu8FChtUrs6P057BLkASVRH2e9ejKb0HnY+ISiZM9WlLa9cyfEF3hmUg4YNC
	YoWVjt5UnJe7RN7rzdwuXRDgLxDNLbmOfQQ+lwTsxg+iCxayQgqQnxtzRZfDJ0VXZSx7iBk7arv
	Fvki8xgXAgTRC6rPMVhE28jGA1Zkbtxg+H2oc7RJzD9ppCs1RWlv1juAMlpaAVroFeCOBh3ECq7
	ndVuD2nD+fRnjk9Opyk55kUuzEwGvbVTVfRZaeh8Hhy7/31tKKoDDHXt
X-Received: by 2002:a05:6102:3053:b0:5e5:66c6:d23e with SMTP id
 ada2fe7eead31-5f1a6fd7b8amr6454095137.1.1769089787209; Thu, 22 Jan 2026
 05:49:47 -0800 (PST)
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
References: <CAAFL+NPbt+TkgsMZYZQQoGAhhUhYJSB_Hzn_U9nCzBQoTnSPEg@mail.gmail.com>
In-Reply-To: <CAAFL+NPbt+TkgsMZYZQQoGAhhUhYJSB_Hzn_U9nCzBQoTnSPEg@mail.gmail.com>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 22 Jan 2026 07:49:29 -0600
X-Gm-Features: AZwV_Qhrt8spgLgir9mAbJt-3zDoWTcuTy1fnqdCfuCcXC9ZH1qqzKdbb2rhDOk
Message-ID: <CALLMt=o3x3i51Fscq_YZ1mRpM_mKV9dHt1ea5i0Ya5QHtswvAQ@mail.gmail.com>
Subject: Re: Request for Gerrit account approval
To: Nathan Jian <nathan.jian7@gmail.com>
Cc: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan.jian7@gmail.com,m:openbmc@lists.ozlabs.org,m:nathanjian7@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1271-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: C0F896783E
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 4:06=E2=80=AFPM Nathan Jian <nathan.jian7@gmail.com=
> wrote:
>
> Hi,
>
> I'm a new contributor and just submitted my first change:
> https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/86739
>
> I received "User not approved, see admin, no CI" message.
>
> Could an admin please approve my account?

Hi Nathan, I manage the CLA's for the project and one must be filed
and approved to be added to the gerrit CI approval group. If you sent
it to the linux foundation email then it usually takes a week or two
to make it to me.

If you prefer, you can send the signed CLA directly to me. Please note
that if it is an individual CLA then we need confirmation that you are
not employed by any company with an interest in OpenBMC. If you are
employed by a company with an interest in OpenBMC then you must work
with them to get a corporate CLA.

Andrew

>
> Username: nathanjian7
>
> Thanks!

