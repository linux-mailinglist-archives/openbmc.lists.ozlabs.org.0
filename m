Return-Path: <openbmc+bounces-1266-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNEMJelNcWkahAAAu9opvQ
	(envelope-from <openbmc+bounces-1266-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:06:33 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D85E7BE
	for <lists+openbmc@lfdr.de>; Wed, 21 Jan 2026 23:06:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dxJF15cKRz2yDY;
	Thu, 22 Jan 2026 09:06:29 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768582993;
	cv=none; b=nnE6xlXO6fKJVx/hjWF7TAH2CsYyxd+v8s2YYI6ci0XvRWSzvFi43yYFuvE2x9G+pmXU4QbRoPJ7OomNZU1kpMpxBvLs5MqXaq0s7DNwcSNz+KoBP+B1wvhL6iwHSmLtYICyf8Tl1IypeCxEP0aMApMWXlai1rzg1Jv9MlUVHOe39CwytC7TV92m/mReRbLidxw+iVJkzFA6/YAy7Fj6XoxRj+G9+rwFAQD99QyYAeuIFn2AJTFo6CNvIhBfjela51t0Kd+Y+MHTKJxGGm3hF2ytOCEso2HQ1LeRnd9SJhV+lGlis5IaEahxr6fug4ULxGLma95dW/7/Zaht9S3bhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768582993; c=relaxed/relaxed;
	bh=Ryz/kFTNFKVINZFAt4aXBH3C+UeBVgyLhc/OIrJOjCU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=YF8baDIb3mRTA2h7vhOq3lzwETUsH31K/qR2xZnGDBHurSftm8lRT7IGs1mgEpDj1l+nFJ2/DpueBS/L07pkbmdiPybpgh7B+5ea0Wx4aIVjgex/K4p7leHkpfIabXrg1vlGvcUT2W/xo7hxff1E5c826dcOFbwL3ENL7EoTbiA1N80WH7Z8yiK6Rq1W9L+NobF+JH5P1cz1ZEECSG0WLoL/4hxvYTNrH6kJ54ZqNBhMTh3YwkogAi7SRFOFcobOb71Ios9hlz9+Qs9YvCuXznnSxbTbSqc0GCYzAqyYJjwxejts+ua1cWqzBYacxbNzC4gufxLejxoXt0Xs4JOdpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bUeISNcp; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=nathan.jian7@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=bUeISNcp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=nathan.jian7@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt5lN0wJkz2xS2
	for <openbmc@lists.ozlabs.org>; Sat, 17 Jan 2026 04:03:11 +1100 (AEDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4801d98cf39so8397155e9.1
        for <openbmc@lists.ozlabs.org>; Fri, 16 Jan 2026 09:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768582987; x=1769187787; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ryz/kFTNFKVINZFAt4aXBH3C+UeBVgyLhc/OIrJOjCU=;
        b=bUeISNcpcP2n+9evfsa3UgR1ZtodzMosVILRzXPw3Ly0hcUHYRqGLmviL1NoL3eDd2
         xD9NX63YmtKbP2zucpdS89W7YVkrR09zgJmSeZIp+HVvMtYMAgkEqHotcTEAV6P2LKO+
         yuwBT7JqTiuVlDSM0kiZxZbualLZ/jHBcmYIHkXFvOqxukELtWMdarQo74KN8voJMM6b
         DSPgU/4pxarZZZ2dsw9apl6WEUhTFYwkOZoXRGB6W065ozy/hZyKWDU6fbapX+WFhg0o
         bCMJBCnPan9doRFZGuCMNMLhzlunQrYsnu+ENP4IcpUWO1bXrJbFaipqjac+J8iXFa90
         tcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768582987; x=1769187787;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ryz/kFTNFKVINZFAt4aXBH3C+UeBVgyLhc/OIrJOjCU=;
        b=ISJWrYOxzJZy7Zbd2sASsmj/JmxhZP87MhJf3R0fzmWDcDKuBQYgEDdF2QV6ebT4wQ
         cHnmWBtc/OpEPgco1DQKzu4jVqivxxwSdc6TDAbfzaEPD3TbTtQk6AQsGj9MgfKBcr+6
         36mIcH39gWo0YLmqkChYNUPUvPrG+C+u0ENqKO5umkf8WEND7ONbhornlU5E5aTObRqE
         ZRdSoDDq8zsKrTld6JQIqRJpMVYGKR1LASVMA1boeB4N39Z7hOBhO9WYLSp//bQn+Lqb
         qDQuAGitU6hHppvdYleLjmIfCqAixA93GImYMh9aF75owiDILIicYcdA6mbMVIBkxWmA
         S9ng==
X-Gm-Message-State: AOJu0YxOue1KrOS5Wu8NqRclW97iEJuoCxuCtIzQcf8t7WK5KdEjfx9k
	fmYC5P67/+mGvxikA5p7z01A4D3qYfG0krZe30T2rp4t9z7LC+MGq8tA+qq0qSQMVs9Iux26TbV
	pgojh4xd4bWPPEt8gRk7qnUvANJHzdtH3hNdy
X-Gm-Gg: AY/fxX4i6Zrsqf2LimEQKBfa0f6Wy18jGKqTqEENi/4NvBjnCpEGo4hBtKb/9qF7ifR
	mwT1mEFdIRTYpestkcKwMP4VNYpPinv/7oIUhGCOg3hLj/PY2WTkKPhCSHWH0Q6UcmPwjjS5K9n
	1HDvwG0N/h5YolMXZy+J3+XNPSMSA4hGEWHyWVYqNb489nB9rG8g//Cb577gXZeMPAh5OWXFZSe
	Bng2NKWM/OjJzmTRGsF0VBidM1HvV7V2gv2vBBXEkvGDhF3nyvjW61N9EcJsW42/iL2uGFO9osG
	P6d2fhh7iekKTeQ=
X-Received: by 2002:a05:600c:4fc6:b0:47a:7fd0:9f01 with SMTP id
 5b1f17b1804b1-4801eacf142mr45943725e9.16.1768582987327; Fri, 16 Jan 2026
 09:03:07 -0800 (PST)
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
From: Nathan Jian <nathan.jian7@gmail.com>
Date: Sat, 17 Jan 2026 01:02:56 +0800
X-Gm-Features: AZwV_Qj1DxTY0Qk3Y9PSApyeoy4p5NAKLZo3jLJ6aby7vaLJ2KMZTB-3GQM8sYk
Message-ID: <CAAFL+NPbt+TkgsMZYZQQoGAhhUhYJSB_Hzn_U9nCzBQoTnSPEg@mail.gmail.com>
Subject: Request for Gerrit account approval
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="000000000000b731010648845083"
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [-1.20 / 15.00];
	DATE_IN_PAST(1.00)[125];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.19)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-1266-lists,openbmc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathanjian7@gmail.com,openbmc@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[openbmc];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,openbmc.org:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Queue-Id: A14D85E7BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

--000000000000b731010648845083
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm a new contributor and just submitted my first change:
https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/86739

I received "User not approved, see admin, no CI" message.

Could an admin please approve my account?

Username: nathanjian7

Thanks!

--000000000000b731010648845083
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div style=3D"font-size:inherit" dir=3D"auto">Hi,<br style=3D"font-siz=
e:inherit"><br style=3D"font-size:inherit">I&#39;m a new contributor and ju=
st submitted my first change:<br style=3D"font-size:inherit"><a href=3D"htt=
ps://gerrit.openbmc.org/c/openbmc/x86-power-control/+/86739" target=3D"_bla=
nk">https://gerrit.openbmc.org/c/openbmc/x86-power-control/+/86739</a><br s=
tyle=3D"font-size:inherit"><br style=3D"font-size:inherit">I received &quot=
;User not approved, see admin, no CI&quot; message.<br style=3D"font-size:i=
nherit"><br style=3D"font-size:inherit">Could an admin please approve my ac=
count?<br style=3D"font-size:inherit"><br style=3D"font-size:inherit">Usern=
ame: nathanjian7<br style=3D"font-size:inherit"><br style=3D"font-size:inhe=
rit">Thanks!</div>
</div>

--000000000000b731010648845083--

