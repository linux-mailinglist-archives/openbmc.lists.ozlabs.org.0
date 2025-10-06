Return-Path: <openbmc+bounces-726-lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 792F3BCEC53
	for <lists+openbmc@lfdr.de>; Sat, 11 Oct 2025 01:41:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ck3DQ5dNcz301Y;
	Sat, 11 Oct 2025 10:41:42 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759776210;
	cv=none; b=amDNhmtueBBiZS4HqpUHrdTQp3t5vE1UFsri27JA9pJT54ZnKSXpfSHUIbsmQeK6FyoIs6ROWYEBaypQhMRWua4Gx/4c/ju1VlklaZzufSWnRM8jbO2UXj5ib9YGzRgM27Wjnod6xFykjAwE++pmrMVdVo2Bn7k9ww4jOKzIShncKwqJdd+dnMksT80l8QD/XIBylYRy9LuKBp7F+e35VhBsLv3e/CyviHWzPpYvkgZ7iSAKOh5scp3STSmY89FzaPMqyiW68IHhU/OcIbx4y7boS1XkBM3WcZFZyNHNVuHNFoerqHv8+Ju/uIQiI34bmTlMSs+TjkSElbB1+Hlo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759776210; c=relaxed/relaxed;
	bh=IJCBqSrSEEdW2MEExJPy8ApR0P0j7Hsf2H8xnZOvLuw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mDEcQKYmpk+/alijh0mwEiRyeC7RWfocS4q75aHZgwYkPZkWfDLbpgE9+wgDHnhKxyH9U0xB7lIFFAZGnjW/u1mWxuhpim1RDr/bvXp8bsrXghbWQDBXlpV6/nzi0Tz105O+FmSBgMbBYPUV4E91MuUe+pRmxQgjAfLGE/BnjMtJzhtAvPzZg4Z/0eH05j4bWafzut9LIi800eEf2IWWamZk/HBe/cr5nlQgrdCsr5NoAxEvPJHT9lvWziYSfuZ31thhapBenZ6j+lI92GtFTPOBnp4fVJX8cjwKoU6ouhwojvnfkgqsVK3qusmAy5JOImw612CvTkWlHMvvTay5yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AfAL+U3/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=eng.walidshouman@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AfAL+U3/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=eng.walidshouman@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgSp90TG7z2yN2
	for <openbmc@lists.ozlabs.org>; Tue,  7 Oct 2025 05:43:28 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-8e3239afdf2so3340808241.1
        for <openbmc@lists.ozlabs.org>; Mon, 06 Oct 2025 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759776205; x=1760381005; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IJCBqSrSEEdW2MEExJPy8ApR0P0j7Hsf2H8xnZOvLuw=;
        b=AfAL+U3/YKVMZ64nDA4lN0Z3ORVa8ZU4Et/luNgeOOTmX22MPxDqRt+LjCyATzX6zI
         kTRIyljDn/kfRcBrQGxmB4NdMs7eYWPE1ELBRYf9yfu7/wFVAkTMY4fWhp/M6bteYgOH
         XBaMsj0rogHLxczTel3A5etkaeWWsWNQDlfT2zIGAtOK2RekEK5YPzsvuVJHh9ib242U
         NgPFJlfcbPxpJYdDm1FyC37ge6YHIfPRVdgxXyRycvKKpMTzLN9sJBr+Y/bjmSdXmWsY
         1gwKSRnPekys4YY087j0D+s/ahxslAfJ5x1C233gu3u2q8+rIkhlAwqGKs9bmechWvTS
         ADcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759776205; x=1760381005;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IJCBqSrSEEdW2MEExJPy8ApR0P0j7Hsf2H8xnZOvLuw=;
        b=VEoHZmEgzcH/BpoG0iqSbJwR4iC8+6ECyAg23uac98Tez6Iqpf3JjXXehdV5k1qDD+
         9eKFlZdYh9UKjn7rTIjuMOib+EmN9L4nw2HPjxcHD4GylINlj96NvMcBua/i2QJfchN2
         tvL3LaEFZl/3aJRodOVvHjYsTC7n+3/4pB8bBVyuVf1ohPWhZvut1d64jZVwEY6HEGI5
         xVBWuiC0U3n75cRItLChQWBv3oC3JLZ+7xKyJgapXvsg3Amwj5T6E2nLPIeFsYSyqBGR
         oMDgyTmkoNdCFxkqWhPUqSduLkLX2NYOXuq8I1laB8elRbOVJNsi2pabpoikYqCOn+WL
         4tpg==
X-Gm-Message-State: AOJu0Yxu8UKkB1idJ0C0/OcriXOjLkG6TxfTEBLlioBAxH6iJ0d6ekjT
	9/K2kJQoJaxpN5szpmBIiOfYk+TcILcZiz2SxVJy8BuQbVCdzmk+zGovRctMuaO9PMftow1kZhZ
	SQPhQu+bF5vp8ib96OwfthdHNFmR9BulJp9qpUTk1
X-Gm-Gg: ASbGncsiWo0v7B76ng2hylWxxG7aTcpPcsydycQu21vUdA+w50JFDHL0H4lyCDO1tfi
	2V2S1nzpFkw2GjJU4hdYBnBkefxCphHdYNgVsGdez9yJCO96wn7aV3fFfHVv/PhhfflV18uf1Af
	2ONIc0J9UOk+uLnsdqacEnz4+KDsgCbA7YEk5LogtCL7SqJyefCrYGqGnUYloXPWHPsBskOO2av
	lNAm3uV6hilOsiQOIy7iAyx9jr1ohoekloxNIwhh08AUlqPqlSB
X-Google-Smtp-Source: AGHT+IFFGQ6tEAxbbjXXxq/2G//RYSnINAv4KayrVqf9E/AFRpXbo+z/Ws/8NPGwEIR2+WEGosjqwfZfKE9BjC12ONs=
X-Received: by 2002:a05:6102:dcc:b0:52f:12b3:4505 with SMTP id
 ada2fe7eead31-5d41d10cf82mr5243752137.23.1759776204618; Mon, 06 Oct 2025
 11:43:24 -0700 (PDT)
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
From: walid shouman <eng.walidshouman@gmail.com>
Date: Mon, 6 Oct 2025 20:43:12 +0200
X-Gm-Features: AS18NWDgtKKky632-ndda6W8ndtnioM8cIFnITM6oFvdc208OjxzT0y613Nxo1A
Message-ID: <CADaxruKBGgMe0rEKbid14n-xXbMWaRPq49f53LNDmJDg8O2JZQ@mail.gmail.com>
Subject: IPMI Subsystem video transcript language
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000008f7ebc064081d371"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

--0000000000008f7ebc064081d371
Content-Type: text/plain; charset="UTF-8"

Hello,
Could you change the transcript language to English for the IPMI Sybsystem
video at https://www.youtube.com/watch?v=tAiua7CJ9es  as there are some
parts where the sound is inaudible?
Sincerely,
Walid Shouman

--0000000000008f7ebc064081d371
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div>Could you change the transcript lang=
uage to English for the IPMI Sybsystem video at <a href=3D"https://www.yout=
ube.com/watch?v=3DtAiua7CJ9es">https://www.youtube.com/watch?v=3DtAiua7CJ9e=
s</a>=C2=A0 as there are some parts where the sound is inaudible?</div><div=
>Sincerely,</div><div>Walid Shouman</div></div>

--0000000000008f7ebc064081d371--

