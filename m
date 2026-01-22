Return-Path: <openbmc+bounces-1270-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eGgyENjucWlKZwAAu9opvQ
	(envelope-from <openbmc+bounces-1270-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 10:33:12 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A4C64967
	for <lists+openbmc@lfdr.de>; Thu, 22 Jan 2026 10:33:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxbTJ3CfQz2yFm;
	Thu, 22 Jan 2026 20:33:08 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::42b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769074388;
	cv=pass; b=IoIA4VAVe8VeU9+UUYO+bX5590nc9EEW0SPS0jPm+yCkIvqwStCw6Opi18hmg+hhxOYcuXf6S59UaDNWDKXhkIa6i6jbHkdKj/88oQsnm4HH2lMj3nJ4KBZwbthIcWEUFIrL9m0TuS6vaX5zbI+loLOalHb2pCYdKl3QNZYvL/V1WjwbkzmjNK/iNUCjjjZe1MrxMR8ptV3jI4JgB2PfR9bQ5KRgDPRGnf8atbrvjEuEYAeogBMg7XDRnfAw10QkVX4qkq7Uuqr+QZimp1sgY14UruXck739JZt6hK033Jwk6swLoss5johqVMFoczvwCRzsYcq1NSx+IsX2/CJ4Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769074388; c=relaxed/relaxed;
	bh=Dm4U1VqOtb012lGOYYs4MYbkDRbaSGvwcH8Np0nQYb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L7LOQAtCnDeGLBRdoEWWyiKtgh+QCngLXI3idQaa5pgl0A6QagAUzZXERq5i1Xsl3KcfQMIsEF6NP3Bfi5NaiAjYpb1c2kGsrd3wdH9Jp3zZHXKWxaUHOwPVx4AsD4t+7by2mTHPGEVGNkq84pkNUnHRU3Z3mQkrzyYjfK8N/Rr22KBHTPpzREMWHBKMyQjFQAgUiBU0kEbL+b7Y+B9vtk1WQJuC/JN7n/2FVQ+zKMET0ueZGIUHzmWvuZOVoc+jbQIoM7yo4lj+i5psvxCDfghezyzte3yj7hrMnJgPzRl1NC7UtNs6Dr2jb0O+lazjMNu5fakVXL9Sm/O9gnepJQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0AICRxC; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=deepak.kodihalli.83@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V0AICRxC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com; envelope-from=deepak.kodihalli.83@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dxbTH1ZFjz2xS5
	for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 20:33:06 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa9so476208f8f.1
        for <openbmc@lists.ozlabs.org>; Thu, 22 Jan 2026 01:33:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769074378; cv=none;
        d=google.com; s=arc-20240605;
        b=T5buHYhmql1oyMJSZ4RwxPh82cbBIoVgV0Ncc/xT8MiKTXdCx9sItCs1YHtoeHU4gU
         AqaOxMLMN4Znl2/l8kayR6mj7AzcafH1s+lBJTcAMc2cHae9vY7D0Cggij1lQfb5biI7
         xfwUa1lOuelGwhKxdbBXltKIHcbwJ6ApdwkKccyATpGlUi5A/0GmIuBNVwAkJne+1NBA
         GbyxJqjuVAC/oet35NhdEimb15cz2w2sfYPZ6OzEw+R5cmNhb8D7Drh26S0+w1RBDGXs
         eXz4Y2H19aSx4rw+SHybnExJ6jD+XMpOfj+BoDs062BNNrJwq18KMAJRpAdt29Xx9U7i
         SkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dm4U1VqOtb012lGOYYs4MYbkDRbaSGvwcH8Np0nQYb0=;
        fh=FD0vqnDumQ9DSr/xVRIdO7ly46uZxiceyiQs2zsUQTU=;
        b=My65vGWW0Mb+T7390672w7PFmxfWax4ElKeH4qI6rxw9zDWsRR+KCbeXFq5zFdcNn7
         +Vth1Ldn4yCmS8Rq3GflYa395d/wOxBGVhaQP4oAKFfDglGRvJmoBKI/WmPMqZARZdXG
         xJcwCy4q3LnlabTBbKWt3Q5RJGk/KyhxbN7OggG+ryWZxdY0b9T8grGQ6nz0WxrAwzmB
         /FrZCBCKIt4AjJmFVx6ggNYg0/32pt2BFkpo4Y35voVfRxVlMGfu6jK0q5Reuxc16tph
         aYROh8jFnbC4IN3OOxM/LAo+DODgFdSPOp5sv+rWvYb62daMJfQjIM2DqVtFbuqnls7o
         6bNQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769074378; x=1769679178; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dm4U1VqOtb012lGOYYs4MYbkDRbaSGvwcH8Np0nQYb0=;
        b=V0AICRxCS0Ym3ZI0jfGVc1f+ClISXiH/CJU3gITNlL8H7tLgJdDvAKp4GKNT7HeQ3c
         YEcF1W5DY7EYBNM7qceiVgUhJX7Q8tiuZWtKF+GPNP2hCM033XkdpsXBdiEq+HBbkPpQ
         ny6YwxF9Qh4gNAtD3m5h8XT4q88DjBWk8iDhkLfoZ0Lb4/pdVtTXxrHJwVC83pU1oVcc
         3uXlmghski5XwyqkJesGysVt9WcJ9yJPhffG3S1FcwbcHQNPMjxhVx3jKyQBDuTGN0Z7
         SoB+qP5GqgNQeLeE14k1dFFMUwO5qMU80IclwnJp0FunJQKj12LNe9WBJET/HZe2AK0i
         Kabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769074378; x=1769679178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dm4U1VqOtb012lGOYYs4MYbkDRbaSGvwcH8Np0nQYb0=;
        b=lo77Yka8dpRjG+VkYzVFChKLT35LdtSz8USnJnyRcFfUaxPKX8oSQXCReVGyu23+tT
         QSklNnmre1sVMD1l5XObfc3VRjDcExQKMsLNbm6fZXZDi28oj2wl/kAbtUSJBBe6aQWy
         MTpWbssEeKeznPk6wJVRMbx6kqAboZYF2SZdUjmnijJ7P4XFhvlJOhLxUUEwfogJtr/p
         0USU7K9T9TKUPH1l0Rr6RHBNka/1tin0GVqm1shZnHPVT2DdoOd04VNvOH8DPJSc2ZPy
         35CNmUhHyf9A8SNJiUf6JCv2mJ+waR6JmncnQNKVf+ezPHBDsjeLuM0dPXr3XOOVDwOd
         4SeQ==
X-Gm-Message-State: AOJu0YwRkcwvbdDHeuSz0QT5Rhj98zJGOOZdVAN4APTQqJNGx0XDJVk9
	zhoBFyct8dRGR2CpiZnmAJnTTU+LbxBFUD719Sg1Y5qqqPAH4qmbPPCYDQ4KhMOm/MOORejGQZA
	80WAY9394ffvuF4IrJ0OV5o+d6oS7+LU=
X-Gm-Gg: AZuq6aJM68shox4+DJbhDdrHJH5uUz/LfbhqTOmnDHr7B8otX5C2BHoA1AqQxX+nOYL
	LiNJJbj5qeTFTHEdWmIY/CAACs0GNnq6ksaJUtxQRiUZr39HBq78oCxmFPpUW0HhNomQfQLu0dJ
	q0J36poD5izB2b3FxdENxUtNfNj7JpDZ0UJTGg4JgAsQzud4dDiNWO4XVeCFC9rHYEZ0NOif5kK
	K9xazi4DFaW0ukwcE/ZPZ9lsXzmrkc/o/vE2QaN7wUCHfuCwF4tRN7zoACYcqjx0C8q1lw=
X-Received: by 2002:a5d:5d83:0:b0:425:769e:515a with SMTP id
 ffacd0b85a97d-4356a05c0bcmr31411380f8f.42.1769074377995; Thu, 22 Jan 2026
 01:32:57 -0800 (PST)
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
References: <aXDmS4BmR6AGXKGW@heinlein>
In-Reply-To: <aXDmS4BmR6AGXKGW@heinlein>
From: Deepak Kodihalli <deepak.kodihalli.83@gmail.com>
Date: Thu, 22 Jan 2026 15:02:46 +0530
X-Gm-Features: AZwV_Qg2esiEdAuvn_HUK2aYKFm0T7LRSrOmycq86wM2Qe_Rmjfoh2RL379LYic
Message-ID: <CAM=TmwUBwTTHM8rypH+zKP4J1GEjh0DFTXTfMD2DF117sXgKCw@mail.gmail.com>
Subject: Re: TOF elections for 2026H1
To: Patrick Williams <patrick@stwcx.xyz>
Cc: OpenBMC List <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.1 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:patrick@stwcx.xyz,m:openbmc@lists.ozlabs.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER(0.00)[deepakkodihalli83@gmail.com,openbmc@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-1270-lists,openbmc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[deepakkodihalli83@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,stwcx.xyz:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 27A4C64967
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 8:14=E2=80=AFPM Patrick Williams <patrick@stwcx.xyz=
> wrote:
>
> Hello,
>
> It is time again for TOF elections.  The current roll-call is available
> at:
>     https://github.com/openbmc/tof-election/tree/main/2026H1/rollcall.jso=
n
>
> For this half, we have 4 seats up for election.  Currently those are
> held by Andrew Jeffery, Patrick Williams, Jagpal Gill and Jayanth Othayot=
h.
> All 4 are eligible for re-nomination / re-election.
>
> Nominations for those 4 seats may be sent to the mailing list by
> replying to this email.  Only those eligible to vote may nominate or be
> nominated.

I nominate myself.

Thanks,
Deepak

