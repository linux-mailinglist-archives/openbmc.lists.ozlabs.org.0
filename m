Return-Path: <openbmc-bounces+lists+openbmc=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+openbmc@lfdr.de
Delivered-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589E69BA8EE
	for <lists+openbmc@lfdr.de>; Sun,  3 Nov 2024 23:34:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XhTsR6vQhz3c4v
	for <lists+openbmc@lfdr.de>; Mon,  4 Nov 2024 09:33:47 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Delivered-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730492990;
	cv=none; b=YwrmsUPt1zg+Z2BboWSM4CUP4h2y3M1ELi542T/qz+lqpsbtwlYOkcI+SugRioNe378kpqgfNHvLbLocNnI5nrQivNQNz4FGqrHyXGdEQ5tAOPsejmV2yBR9o11lza6b9Ysxl1H3cOEHpyBETUmbZGAEvIQTSMpbQaNgjmwqKjBpieVtCnv0WVDvHAaEsrWQcD3tFmI9pYIc8W+Otdfke6/Iemsp8yC/hVd4HssJXZInFND7eNc0zaiS2jl7F/PTPhMyTAxEHQ5/fHMrIh/U0bM5DzpVSwVaPmPyWlobeITQts3pUJHgw1ktLxwf6I6+PpDNWzC5h79jNGeQacgvNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730492990; c=relaxed/relaxed;
	bh=13nnIQ+RPgggLcjKMNs6nmDQzdsDlidYy5CQKwZLAws=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gmqvyuzaoenovbmdP6CjGd6r3C+OQrtzhDg31fkl7EqxtOBA2SEdOwYPCyp/VoH7fo+wGCmP0CTYsEOJIZVAhmUjOL4wVuP+9/pi8GbBvSyVgIQH8wi9NXv8UTpRxliyc5hrcmmDoVxeuFcenIcZ2bbZhChdEgqbQABTHyZLA9YzlMa45tRcgUIy4eT5X2Cu7fDhZmzPiziGm0LMjocbgArg9awx6KIbG6g7hRCaPk8oa3wWlvdEiG1FugDCUpudwpatZlq1Qhl97ULI9oGwZw0yg5pnfwtV/aXb5wbl8HiWiK7qxPDcUDY+qwR85zqDMNeYmaHQfPoLuetXzwQvIQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sntElkCj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=elbadrym@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sntElkCj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=elbadrym@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XgCCJ3537z2yDp
	for <openbmc@lists.ozlabs.org>; Sat,  2 Nov 2024 07:29:47 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20c87b0332cso12575ad.1
        for <openbmc@lists.ozlabs.org>; Fri, 01 Nov 2024 13:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730492979; x=1731097779; darn=lists.ozlabs.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=13nnIQ+RPgggLcjKMNs6nmDQzdsDlidYy5CQKwZLAws=;
        b=sntElkCjwyTzRom7kDou7fhO/KKE0CQWd5iaPcgSti5AChGdtKpfZfyxlw11T6oGr9
         aXkKhrBhtdzAEqXw5oqAi5br5tZAtSK6DJfsYSqXcD3MGd7izyZv42Qli3i9tAUh5kmF
         M0KUVLAOl5Y5sOoz1J8wspeuLILhoUP5Z/HRd/23JsDJIL/Wq7p8wdXluiCktBemAdVa
         Cl1tz4husumKFb285e5oDwpPvFztRroXup/U0OGuQgtqlM0PiLK9bDI184KGOsnBSI3l
         zRhOZcTXqs/uuJGfjxlF15Wap8xonDvuO9XPc0dGxM1gYIQzwwoP5gsn++QiEcH/+er3
         CR9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730492979; x=1731097779;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13nnIQ+RPgggLcjKMNs6nmDQzdsDlidYy5CQKwZLAws=;
        b=oXRXc9YQL1m05chXWul/ONzed8yEr3QTEuRDE+DRB+a9RcGSLH/dZTr7Jhwg74nNkU
         Jh0p/aR/41O73CHZREWKtmJ92CMyCNt/eDZhZvXWtURNFzD1GcF/PH/T/osdntIbHtbP
         fdWuPkTKgOLpZjPECgbSc7GJB7fssCTQsYWQ3r4Phj+1Mbz9hnj+Zo/XqHFyv6v7eRQO
         KpLpM7Ixd/GrEOEwnfqRipGxLbRdspWeNA4OwTrZZ4vYkY2moHd/dX62/A4W0KIMjBGS
         HyTjHcvgKys/fp/7AHdfE/EXgw7/8tHqsUY9j3jQAFotugBDEYIgn/BmG98p1Py5cur1
         ZQkw==
X-Gm-Message-State: AOJu0YzhA7kp+RH5gFsWtxKWMqfSV52laSuAyeiZITAOhKtArIftCWG9
	VXqm2wATdyVPOkYYJN6dx+1FLyj2o+O/Kbj/f+rChJ3lFUy/XzzSMeVrrZJGq5UvU3fxEAYO0oo
	rCng0YAmc9HlCiNbtqLLnDVyzzPwB66tR2wOxgjul/G5maL86Yw==
X-Gm-Gg: ASbGncssS9h3PjbISXeBihtvECPkJrBWgsJQ+h78Ixl9MqA+e891kMWiyzfbRxpAgEQ
	TIHL8yPFykefxNov3xy+treP2NlT9MJHDCD24A1lhTC4zijmhLQK8cAHyF4ad
X-Google-Smtp-Source: AGHT+IHXVHKhOGZqrpeHaZqonv8AyL3ckHi/M9BkcKS9jp6E7nJ3jeJlBBP6LDRUuYTquyy9xb7IhG2Yt9t9VkJeXVo=
X-Received: by 2002:a17:903:2441:b0:20c:ecd8:d0ac with SMTP id
 d9443c01a7336-21134d11b7emr44595ad.9.1730492979050; Fri, 01 Nov 2024 13:29:39
 -0700 (PDT)
MIME-Version: 1.0
From: Mo Elbadry <elbadrym@google.com>
Date: Fri, 1 Nov 2024 13:29:28 -0700
Message-ID: <CAOO6b=ub=zw4Tu4PM3NbSsqNb=hz_pxLAxTCwqqJjCr2jQ8ENA@mail.gmail.com>
Subject: Gerrit Account Merge
To: openbmc@lists.ozlabs.org
Content-Type: multipart/alternative; boundary="0000000000004df4860625dfcbce"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailman-Approved-At: Mon, 04 Nov 2024 09:33:43 +1100
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

--0000000000004df4860625dfcbce
Content-Type: text/plain; charset="UTF-8"

Hi,

I just noticed that when I changed my github username openbmc gerrit
created a different account for me and I cannot access the old account
which is tied to my Google email.

If I may ask, is it possible to help fix this? I don't mind losing the old
account but need the Google email free so I can tie it to the new github
username.

Previous username: melbadry97
new username: elbadrym-x

Thank you,
Mo

--0000000000004df4860625dfcbce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I just noticed that when I changed =
my github username openbmc gerrit created a different account for me and I =
cannot access the old account which is tied to my Google email.</div><div><=
br></div><div>If I may ask, is it possible=C2=A0to help fix this? I don&#39=
;t mind losing the old account but need the Google email free so I can tie =
it to the new github username.</div><div><br></div><div>Previous username: =
melbadry97</div><div>new username: elbadrym-x</div><div><br></div><div>Than=
k you,</div><div>Mo</div></div>

--0000000000004df4860625dfcbce--
