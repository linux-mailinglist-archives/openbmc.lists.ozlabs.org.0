Return-Path: <openbmc+bounces-1437-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mA7JOm2UqWlCAQEAu9opvQ
	(envelope-from <openbmc+bounces-1437-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 15:34:21 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D0E2138BE
	for <lists+openbmc@lfdr.de>; Thu, 05 Mar 2026 15:34:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fRX9N3RR6z3c5f;
	Fri, 06 Mar 2026 01:34:16 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::e2f" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772721256;
	cv=pass; b=ixvGhMDgjto1a18Hjr54wDrwnMR/pQa/n3QN2+HK+tMPTpVLCG3a46yGO91GDi6hrSyHGIo2fiuU+APbvoGO4x+CR1fPdagPjzK+bouqeyBAikE6ylQNdMMv7vHFoHdUS933qBtrjtBjgebOUP2Mz8fRMJsKZX7+I/TXxTMxe+3kXhzd6cKoe6qoFoaKGVTb03NL7KmDPBmy4ZrwcUHTafOHZ7W8RqSJU7ajPUx6VGNKzxTA06ljZTMyz95fG4InrL5bMNpHaFiSwdueMqhFHwL/sLYgV3G2zmSc3nSQ+5gfaLH0JVyrc5uyzxsDU1lhASwyhOyXBBpqzfHmAmYXRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772721256; c=relaxed/relaxed;
	bh=NScwBoqrIN54PmMpUqktmMr71N0AYYlMad814fO0L9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nwW0tsHwbW43FQRX9UBbBpPW2UTwfNoTivEjMgDZ/f1hu9eTnMvjmbOhSJmqTa0eOSJzCGalBj4/LXQ2SXy5gQSb9gS9B3El6V+rRp3iGBHuyh12e4b/SassoHjceMqljto+FwRo3UukF+Z08g20qqK0jtNzJU+VQOiOxbPHSdZaQmfuq1Oz8OhSR720l/C8tGJvYD08dtsy2RwdAhl857HGP7/q/p4NjpESOrv+3gIjMNAi5SCSfcxW/fI6g++bO8ea1fgYszLy4TeZ6m6jpEUK/74C2A8P6sS1G9jS55UlpXdPu9tgDbGSd97YbOz+7r7KOKyvGX8nT7XncTVLcQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bk+l6ZgD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Bk+l6ZgD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com; envelope-from=geissonator@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fRX9L56HKz30MZ
	for <openbmc@lists.ozlabs.org>; Fri, 06 Mar 2026 01:34:13 +1100 (AEDT)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-5ff9d047981so1893606137.1
        for <openbmc@lists.ozlabs.org>; Thu, 05 Mar 2026 06:34:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772721250; cv=none;
        d=google.com; s=arc-20240605;
        b=JSMBF69mGJrcrFyJ69H8C1bGhuA4zmSHX1pywOTc3eKq7OcQOxA7vE3vlv+J2yO+/J
         D6oL50bQZ36Xs5Neld3dr/FBpAtkvUA6+B0uARN9xuz8SHrWqTlbPTQW96JmkJWYKbzC
         WcU78La7bp9/vnl6m2OlTAseS0IgOb2hJ/LR6qZ02kmcoJa5cKSt58pRd3REeNc6cDy5
         XB0BNv1YXVor+C5NA0HviiAfCk79pUIVpCPAabfIDDDVB/UlP5WKAosU1Ksd1Kz/iUJU
         dXidtw7oaNxZeGlJrSOrcuYhuS9UWQhCKweryXNKFqM31ebyRWAzrjlWSY3vrApVRzMP
         16vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NScwBoqrIN54PmMpUqktmMr71N0AYYlMad814fO0L9E=;
        fh=+nwYwJK03Ehej1j2YipOK7ULFLBAfPu9utOMaU9g0fc=;
        b=RAe9Twi/udd1jdZgpCQ9ctnIeoVpFDR8lgpuJX0XkSMmy9+elWsSiZOFKSUf685gjA
         Dhh3zDYSmILceAbl1PqH8+3ALhVShFO1MNJt8RtshsZEmJR1e+/kkUA1cawciSLVm+Y2
         lxEEFbxYDJrvJ8+UBfoXy26Sa7kVbQeaaEaEUehdFG5TKkR4oEirJGUA+yQl1TRVLD5t
         lcNuURkSkIDPFITUAVWCVJnS0vDACG90v6I+Ho3ESzicUOWaZ/3pyfaypfEmIpUnG56I
         Nj2bSuztx8Uv4aZMsUS9pRPbVZkmVdQPiqwRVE06ZxWdlvC1GCfsu9FyhtYZbn4gKCaK
         anzw==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772721250; x=1773326050; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NScwBoqrIN54PmMpUqktmMr71N0AYYlMad814fO0L9E=;
        b=Bk+l6ZgDQDpNDc6XwH2M0R7kLZgm+P6bGMWNsvjEZP3W4w8H/yUXw5NphiyED2Q5v3
         VxIk9Pxqhfx9uIRz2cehC8yQU9uciibIu/pYMPCrdBON7ltceEw+0OOHgNSb5l7AzJG6
         8enb/x1jDDlEQ+Hn5xYaSmdQWSPBJseQkscP96eLLLgeYZakIJzf33V5B2OiCYOeAHd8
         G8SJLFe1I7uFYImnFMkfsc8EJX7UMWY3cV8szkb4BSCmDHRX84JPRZo/b4l+08wAy/xc
         +MYny9RXaUgWVYEIOs/rNraJW9vT6w1SR1EOWfmufod41L111GWhNla6zHWHMBbzVqIH
         VA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772721250; x=1773326050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NScwBoqrIN54PmMpUqktmMr71N0AYYlMad814fO0L9E=;
        b=ILFiLFHnQ7ZM8Ft2rW13ibyS7TFk1dPMl7HsBa2DnJuC471DWGWAV/J5IHuXCaDjwq
         RpCvJKWzhO2Orjd26K7R9EsYk+bMBHx8zmzmcPGQeivV9CC3gf5detLePTjF5da4RmZS
         U7BC1YTbnUmUZ+uUATApVKA1D5kdNbuA+0kN0dM7rU26WvOsdYwaN9Lfeot8mtlTm+10
         PFbiTI89geVZaSaKJvj0Xau7e7/gUB62vSykj5i8Vl5eBLvzO4eKJoATgdWFGWh7qkc6
         HNWE+5Oa2zQoX68GVu0clF2vnx+PMh9lz02Fn+cxL8Foi26+xaZ5jFeMH0WFixqghU5B
         i1bA==
X-Gm-Message-State: AOJu0YxXLsfpMYo4xAPJ22eU2BQyhg3TreVnugr+n3h/EgELQnV18bv0
	XdBhXi3E2/IUSJsQLHv0U2BkLYqS4VFubQ2rKMx3u62QZgWxA1ZlSYXHorfRHxXOu70+aIbL8X3
	BCzJ3h9WNW9M6KBQ4riLr3g8I8fVBLuw=
X-Gm-Gg: ATEYQzxEkHOH4T7J7zDv7T5ctoTzfyza0JHkA/bn1ROiZ3UTtwXPxIENfIX3dMXK9u2
	NQ3gfosOdyZ8Uu7UXI1EF0gSTwN/6XaZtz+Bg438aFTuGNmONvJqGugHBdnsAHWpcKpyqpzi31d
	BHez2nphwh4jZZu555r/1Cck2ZVWwmqFzg1rxvwEwVBkKOQxhNesxUBh3cG+EfdhR9bNArC4vyt
	MGgNjBYiDmxLqOwO9toMaGgW4Qkb1gvozmTWPBW2ypuUTAXKJvf8wRViT3Qu2LofW+OLnTnubAr
	wNNNKlhIkv9gZOuAEFtYyNWUYNUahcrHgQ90jyiEvBHn+5C6pdrwVsCXTPkuIHemzdde
X-Received: by 2002:a05:6102:3049:b0:5f9:2ac5:2fc4 with SMTP id
 ada2fe7eead31-5ffc8ee1c77mr1033092137.17.1772721250354; Thu, 05 Mar 2026
 06:34:10 -0800 (PST)
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
References: <SJ0PR84MB1505D06E519A74D6DC18A272F07FA@SJ0PR84MB1505.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <SJ0PR84MB1505D06E519A74D6DC18A272F07FA@SJ0PR84MB1505.NAMPRD84.PROD.OUTLOOK.COM>
From: Andrew Geissler <geissonator@gmail.com>
Date: Thu, 5 Mar 2026 08:33:53 -0600
X-Gm-Features: AaiRm51NjfyTOUDC-h0xia2xr2CcTPYCy5UkuiBEbe42J5S8-9rPHoQIpcHJ2Zo
Message-ID: <CALLMt=pCmZy1SuSikqFSSaovxJKt0iv-Vn-nbEf7iaq6jMeWaQ@mail.gmail.com>
Subject: Re: Updating HPE CLA
To: "Fischer, Matt" <matthew.fischer@hpe.com>
Cc: "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	"Mujawar, Tausiff Hussain Umarsab" <tausiff-hussain-umarsab.mujawar@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 83D0E2138BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1437-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.fischer@hpe.com,m:openbmc@lists.ozlabs.org,m:tausiff-hussain-umarsab.mujawar@hpe.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	FORWARDED(0.00)[openbmc@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geissonator@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Action: no action

On Wed, Mar 4, 2026 at 5:21=E2=80=AFPM Fischer, Matt <matthew.fischer@hpe.c=
om> wrote:
>
> Attached is an update for the CLA for HPE.

Thanks for keeping your CLA up to date. I've uploaded it to the
projects google drive.

Andrew

