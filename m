Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE9A42D33
	for <lists+openbmc@lfdr.de>; Mon, 24 Feb 2025 20:58:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1s4S3Cv8z3cCx
	for <lists+openbmc@lfdr.de>; Tue, 25 Feb 2025 06:58:48 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b32"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740427124;
	cv=none; b=OQ96YBDwxJJIZGd8CY6so8FQYJtPDyupNEgXQFZycwNQJFc+nYwSHQir5psW8HZ3qSsYWQXKtSsqIXM3/AJ7SyMSvJciSvbW9Mm+X3FkQnxRPu5M3TNXXbO8PCABjT8lIPJwSq92Gm1QtQYGCN38gkZQVV8zC8pNVWhgL3jFKGthIhgASbXwKgNurofFthSxMJRuZMh8EUwGl371PSzfjKibV606e6HoV63woZ+sbkqp1AoHsJ8KXlaU4ckywYXP9lxE936pYHaK34aEmnY4TX3a8jtgHrlGNNd7hAydMjyE3JJTivNrQBcISub+edqFb7sugF6Dhqhl0ogmQfnkfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740427124; c=relaxed/relaxed;
	bh=sfWFgD2Po09hJv/WQEZJ0FUDeh6TGcc7CgKybor5KN0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=M+GYNgMizVuoviy8/zpyH5MpDSa0BGvPuuD/xOuKM/eahW46MoZddXaQNlTUxdH1fPk66ZY4ilz+ICLhTC9NU+X4Ax3UNFNWQfDZta3DEnz/bzfr/SfnB9WQsPsz999qO4fZVMXd/eCmSmBdiu70Y7PbejTYEOdPFtQ4C2UmCpaSiCiGxVYylbk8dSBlDbQtMjA7tGczMrdqFHirS9nrpbgw+aI5BkgwGlZOjttlAgTmi88otSSEFaXWlucmAPd2cEtiTebs2dO3WXROcCVE+iFcB5zrJfEscG/5REsBbxEqtgVRjzmZyxTThn63SGTzDKE6bk+SGiDUg6EfQvVw+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aeoncomputing.com; dkim=pass (2048-bit key; unprotected) header.d=aeoncomputing-com.20230601.gappssmtp.com header.i=@aeoncomputing-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KMvqeirO; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=jeff.johnson@aeoncomputing.com; receiver=lists.ozlabs.org) smtp.mailfrom=aeoncomputing.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=aeoncomputing.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=aeoncomputing-com.20230601.gappssmtp.com header.i=@aeoncomputing-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=KMvqeirO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=aeoncomputing.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=jeff.johnson@aeoncomputing.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1s4M2M97z2yyJ
	for <openbmc@lists.ozlabs.org>; Tue, 25 Feb 2025 06:58:42 +1100 (AEDT)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-e5dbeb13ef8so423631276.0
        for <openbmc@lists.ozlabs.org>; Mon, 24 Feb 2025 11:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=aeoncomputing-com.20230601.gappssmtp.com; s=20230601; t=1740427118; x=1741031918; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sfWFgD2Po09hJv/WQEZJ0FUDeh6TGcc7CgKybor5KN0=;
        b=KMvqeirO0/6aBve9XzVuJPh/3qehkcULDncxmgM4eOBct5riYVxFiZJ/kSIkkMej3F
         xLNWx8ty5Qy8qJ9qIv+dYsaXdI1r1JBt3/xBvkCdplmRiM0takWzmm5nTVYap8fWkc2E
         1zEkQsKf7FfRCjoYdZ6yCdTDXjiPgHUkD1KoZSOqzJCcZiYoWZNQuu14FGLyMkB2S1xP
         mThupmrINN88qL5qdzBfeAsZ4ITGR1OG1hO12u4f6JeeO79830NgnhgeiMEisEn78Eqc
         Mr9inTYp6CdILkbVoYlbtUQ1mkxrZszdxfcCZVp11uRiSamW6eGFMlAhsw3qtqDZpwLQ
         8yxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740427118; x=1741031918;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sfWFgD2Po09hJv/WQEZJ0FUDeh6TGcc7CgKybor5KN0=;
        b=suNMgsXX68rL7qG9+XFJIAmOvPp5/Ds3j4xD2vUcL6LRVhlUhmfqLstl0Ao1GyrKPe
         zSUzDKtIliWjCG4ICSjDtJk5Bu4oaJJQlgrhMRhLCcbM3DO52B18rGZSj+vEMfuqO3Zw
         p04EecMIvuqg482IAM/0tuoCROD4yN98DZXfNPL6aA6+Ib8V0M82ut8L6hNLQf4crBW2
         QhEOEy9zGhcjo11/9B3vzbHiPTFj4QgTdsEc9Z7HbrfhVINGxmKy+JTQAvu4kyABcRu9
         HY6scGu9oK3TGyL/xVH6FOAqMZok047pMC+Pn06nULMechKNIekT37RGoOVu78ddaHQm
         wlqQ==
X-Gm-Message-State: AOJu0Yx3w4X78hixGNTLJg/buNPogzm1tK9vEm5RcftQMjlIW7hybipG
	gG3zf+BWBHDkvqfzksRc3/Vxz8LEltIWxSJF7SGt17sSfmXeBHpeCph7C1pt7j0P4n931eWRZRt
	1lOW/kHB3NJ/D/+j0AECBzY1d42TZIiPmt4WKbjE1zgXN7Qsc+GY=
X-Gm-Gg: ASbGncvWQTF3ZlXXoBKqE2Lg39mENpUgFni4vtNSdSE57bq7uchgQ0A0iWp/6u3z5Jl
	jdf1zd9XChnYUm6CUj2fkPeijJp6mFsvDSik2VeXsWWRgOnraysAFPhjNy8Ym7pG/9dnyDUvE0D
	mEhrEhoEw=
X-Google-Smtp-Source: AGHT+IGn92FqX5rKVXLCZ7DsHrbF4LTOdFHJfpM7h1buepN1LLL5DZ/MSfluuje18orTrMhYeg7fysmok3zOGY/oGdE=
X-Received: by 2002:a05:6902:220b:b0:e5b:1fda:863d with SMTP id
 3f1490d57ef6-e5e2466f100mr3984900276.5.1740427118571; Mon, 24 Feb 2025
 11:58:38 -0800 (PST)
MIME-Version: 1.0
From: Jeff Johnson <jeff.johnson@aeoncomputing.com>
Date: Mon, 24 Feb 2025 11:58:27 -0800
X-Gm-Features: AQ5f1Jr4Nx5NdexojAz9gUvcK_G8Hyan4NcxiL5Iz14n8ZEyfkEarZwm2LM5JbA
Message-ID: <CAFCYAsehYZZTEWkZ3PuTcEG6ivTodXPNfV1pRZF+4qTXL_Qs8Q@mail.gmail.com>
Subject: ASpeed AST2600-A3 random resets (message BP0c00)
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
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
Errors-To: openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org
Sender: "openbmc" <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>

Greetings,

For weeks I've been playing hunt the wumpus trying to figure out why
ASpeed AST2600-A3 SOCs randomly reset. The only serial console
indication I get of the event is "BP0c00". No messages or console
output preceding the "BP0c00" event and resetting of the SOC.

These reset events appear to be random. Sometimes they happen within
an hour of powerup/boot, the last event was over two days after
powerup/boot.

There have been console messages preceding the BP0c00 message but in
some cases those messages (eth1 NSCI AEN) occurred over 24 hours prior
to the BP0c00 and reset.

Has anyone familiar with the ASpeed AST2600-A3 SOC seen this happen
before? Any ideas what BP0c00 means and what could trigger it to
occur?

I put it up on pastebin as not to clog the list. If anyone can look
and give me some insight as to what may be going on I'd appreciate it.
https://pastebin.com/TNup7kjh

Thanks,

--Jeff

-- 
------------------------------
Jeff Johnson
Co-Founder
Aeon Computing

jeff.johnson@aeoncomputing.com
www.aeoncomputing.com
t: 858-412-3810 x1001   f: 858-412-3845
m: 619-204-9061

4170 Morena Boulevard, Suite C - San Diego, CA 92117

High-Performance Computing / Lustre Filesystems / Scale-out Storage
