Return-Path: <openbmc+bounces-1338-lists+openbmc=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+openbmc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kICGHV8QiWnG1wQAu9opvQ
	(envelope-from <openbmc+bounces-1338-lists+openbmc=lfdr.de@lists.ozlabs.org>)
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:38:23 +0100
X-Original-To: lists+openbmc@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAF10A7F3
	for <lists+openbmc@lfdr.de>; Sun, 08 Feb 2026 23:38:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8N5S1t2Wz2y7c;
	Mon, 09 Feb 2026 09:38:20 +1100 (AEDT)
X-Original-To: openbmc@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1134"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770333013;
	cv=none; b=Hp8me9tJN1biu1UYtJT1M+69k1kzz8vNnld4RPfQhjLQHf73DtqhrjfsMr5QGJg4hoAuwKT8bIDPEh2KjdkRVJjTAu2mpZeARjVNxIW3VpOlpOhhGywYIq9CbCYDkBRoflmlSuSIDCLfunb0Nz5I06NAsyipkqJDRAGLIc1qwthWyybbyw9uxP7NsdRNqguIzIihJ05QCxddM1URhB+NMPiFHhP9InxXPJaby80iQdeYg5GrxwlajJDc5uzEozEusVZfIVvPKEVPbaE8IcqR4Xj5hxMn690ECKCnFzZUW8oqiHU2zOgBqSSbIGQln2LgBzip3XfCumJo9ZMiz4x5/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770333013; c=relaxed/relaxed;
	bh=fWgRlXHc25lo09cFRNtKWNoMeoOTBJh+0Xs1wUEjI1M=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=nx+aXbtfmdJ7QsBhCBvg4Sp+1ezPRv74Nw8F7s651ECDmZgLpNTWEHWadBK5z71djF9pVEiAqJv8YU8fZjvKAkyxwTIwVM7N7puaFvYLhsFnyCoSxpnopM4D9U/9t86AKD/fsWhkuWJDyTcAb08jod12Z3dSrCmF/4HCKp8DoGPc3eZ5uOidejl83nmtvCrvbhrBgd5nGaOn1HPfzgvaf0zKRArWI2rN8sKqKYd5LQh5w2D5nz6/KrNMNT0rWte7rWXmZ/lc45KEEM4ipdG7TfF7o5pXlIA7MJ+myLFr2fIfYhpbPMhr47lZFOEkEfxQ+O4b7AEyOC2iBsloxv4bNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QloQG8DV; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=demiobenour@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QloQG8DV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=demiobenour@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6Xxc1YzFz2xqj
	for <openbmc@lists.ozlabs.org>; Fri, 06 Feb 2026 10:10:11 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-7947cf097c1so1448607b3.2
        for <openbmc@lists.ozlabs.org>; Thu, 05 Feb 2026 15:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770333008; x=1770937808; darn=lists.ozlabs.org;
        h=autocrypt:subject:from:to:content-language:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fWgRlXHc25lo09cFRNtKWNoMeoOTBJh+0Xs1wUEjI1M=;
        b=QloQG8DViwM6+FXN0ck2YLGdiC3isVsSXYCp/dp/hgh8g9UPRV9OhWuqfgMehBdLfd
         Z4onfTWI8a5Ug5ACeSfY9fp7YJGnbAO7vfUhja8RqQdCVsdKFeskEnJBx4/aBjCMIr+/
         JggFeg9875MJXdAPBBwpfxSc/wqhU3Wx5mNH2qgl4qkXQMw2jEUlZC6ckunK6avs5r54
         ZKDnKXB+2dnCMaYdC+OomJmqTpF2vqJbMxqpWKWqHbAXYHRPInPdaScSVWuhH5RDGgLw
         J70t2xP3Z544ox755KUNDl/CSY8dqTK+QWcteDJgbkyEfrFelO/vMgaJWeHUHWS3N5tz
         C1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770333008; x=1770937808;
        h=autocrypt:subject:from:to:content-language:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWgRlXHc25lo09cFRNtKWNoMeoOTBJh+0Xs1wUEjI1M=;
        b=TNDJB4DjdyWiKDlZE/Vmhi2Nz+TUbGSOKpxEEV89h0xENwGDB+O63VaKriXjXSAfCu
         y0U85MjJTYskzf14ZVmJuSoNkucAmdqTW4llCRjx8IR1AFjQdLbMtRREbu2dXdjoibk3
         mUg10l4om18a+nqksUf6JtVNACFd/LRHC2aK6Ka7aqu+MXt+QuKtP707+2Jmd9hAXS00
         cJP7283+ZyuSnrUTHuU/hcRkWyGoE4kioYUW1PD4jTOEID7nInTb2xy0hWtacv4CN09x
         lRINmuzlC0fzTLsoLNkp8fvzj+tZskonqLIqrNOmD5cUuAhpQVv0AIlv3HO3pLCYG7ni
         M/lg==
X-Gm-Message-State: AOJu0YyryIXHCk2JdRHoFabxRI8ee5+K2ORne1hvQBGHIU/KJfO7wZZs
	SLGcgxD/oXjaiEbvkbLKJlBZB+OSuNgcO8EFXz/Py5wHCa/jnFZ6OL4QdPJOWg==
X-Gm-Gg: AZuq6aJRXyJpUy8G/2sv9NESr9VLD/weQDJIv3WJPuMZ5TTmbpcm0JYuJ/AU/1abtqM
	73KbiEbnT1Lf6jylHoOif5fBhhZwdPgmRFbwzap6mMFe6UYLo+A1zy67JAliATrSuSOsmODNDN+
	VqISiK5PvFijq9X4LUwIV6xksyf2Ma9P71/AWs/apzy7i4i6x3hhiAg03NIAkPLcRZq7I7x0lQg
	pw8CADIVY8yGwD/ZxQycZTflvVox1+65MNXGdh3zCrOKysgC/1htAMts3KWP8tjGHmhI8zyMx+Z
	VFSSPfS5nsti0jtuBOfQNjaxIOkVXlprPYvOspgSwEaYUray8ZTZKzlkKtxcwoSQnpqJImIM8yd
	Rw4RfwAX73QWS9WXJi2Hkgs8wcoRTUmF1MT5GouWi6zDsA95WutXeBMK5CZwziCqoWqvHbvZ973
	R16ULNKlblt+36MzIoonO56ke3nboKWXirFwpsO8Fz5l2PxMNePOZM9+PHQD1lTdS8l1TjVk4Cm
	kkBxs4jqopciUxNkkYD3rArTHZkZ6v5x1unQA==
X-Received: by 2002:a05:690c:7305:b0:794:e008:b254 with SMTP id 00721157ae682-7952aa744f0mr9956537b3.16.1770333008358;
        Thu, 05 Feb 2026 15:10:08 -0800 (PST)
Received: from [10.138.34.110] (h96-60-250-113.cncrtn.broadband.dynamic.tds.net. [96.60.250.113])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7952a07a267sm7839267b3.24.2026.02.05.15.10.07
        for <openbmc@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Feb 2026 15:10:07 -0800 (PST)
Message-ID: <5686db18-5b4a-49d0-b5b1-6198c1ff6a48@gmail.com>
Date: Thu, 5 Feb 2026 18:09:58 -0500
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: Could/should OpenBMC include a VPN?
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EoauF1oUBJMzNuBcDIx4GsTe"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	SIGNED_PGP(-2.00)[];
	DATE_IN_PAST(1.00)[71];
	SUBJECT_ENDS_QUESTION(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	MAILLIST(-0.19)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-1338-lists,openbmc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	HAS_ATTACHMENT(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	PREVIOUSLY_DELIVERED(0.00)[openbmc@lists.ozlabs.org];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[demiobenour@gmail.com,openbmc@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[openbmc];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A6BAF10A7F3
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EoauF1oUBJMzNuBcDIx4GsTe
Content-Type: multipart/mixed; boundary="------------tOYun1M94nzSIWVJ9OcGMvmL";
 protected-headers="v1"
Message-ID: <5686db18-5b4a-49d0-b5b1-6198c1ff6a48@gmail.com>
Date: Thu, 5 Feb 2026 18:09:58 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: openbmc@lists.ozlabs.org
From: Demi Marie Obenour <demiobenour@gmail.com>
Subject: Could/should OpenBMC include a VPN?
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT

--------------tOYun1M94nzSIWVJ9OcGMvmL
Content-Type: multipart/mixed; boundary="------------goDONf81kOFC7EOsf0Xr8A9K"

--------------goDONf81kOFC7EOsf0Xr8A9K
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Exposing a BMC to the public Internet is never recommended.  However,
putting the BMC behind a VPN can create a chicken-and-egg problem
if one only has one server in a colocation facility.  In this case,
the only device that can run a VPN is the server being managed,
but if it goes down, one needs the BMC to fix it!

Could this be solved by running WireGuard on the BMC itself?  This
would require configuring a WireGuard interface and configuring all
other services (except DHCP) to only accept traffic on that interface.
Since WireGuard *is* safe to expose to the public Internet, this
would provide almost the same protection as an external VPN without
the drawbacks.

The only remaining limitations I can think of are:

1. The DHCP client and kernel network stack are exposed.
2. An attacker might try to flood the BMC with more traffic than it
   can handle.

Are these unacceptable risks?  An attack on the kernel network stack
is likely a disaster for almost everyone, so I'm not too worried
about this.  Hyperscalers have a huge interest in making sure this
doesn't happen.  Many DHCP clients with decent track records exist,
and a traffic flood is denial of service only.  I could see the risk
of a traffic flood being less than that of a VPN appliance failure,
especially if the colocation facility offers DDoS protection.

Would including WireGuard in OpenBMC make sense?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------goDONf81kOFC7EOsf0Xr8A9K
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49y
B+l2nipdaq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYf
bWpr/si88QKgyGSVZ7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/
UorR+FaSuVwT7rqzGrTlscnTDlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7M
MPCJwI8JpPlBedRpe9tfVyfu3euTPLPxwcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9H
zx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR6h3nBc3eyuZ+q62HS1pJ5EvU
T1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl5FMWo8TCniHynNXs
BtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2Bkg1b//r
6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nS
m9BBff0Nm0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQAB
zTxEZW1pIE9iZW5vdXIgKElUTCBFbWFpbCBLZXkpIDxhdGhlbmFAaW52aXNpYmxl
dGhpbmdzbGFiLmNvbT7CwY4EEwEIADgWIQR2h02fEza6IlkHHHGyiLVf/5wiwQUC
X6YJvQIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRCyiLVf/5wiwWRhD/0Y
R+YYC5Kduv/2LBgQJIygMsFiRHbR4+tWXuTFqgrxxFSlMktZ6gQrQCWe38WnOXkB
oY6n/5lSJdfnuGd2UagZ/9dkaGMUkqt+5WshLFly4BnP7pSsWReKgMP7etRTwn3S
zk1OwFx2lzY1EnnconPLfPBc6rWG2moA6l0WX+3WNR1B1ndqpl2hPSjT2jUCBWDV
rGOUSX7r5f1WgtBeNYnEXPBCUUM51pFGESmfHIXQrqFDA7nBNiIVFDJTmQzuEqIy
Jl67pKNgooij5mKzRhFKHfjLRAH4mmWZlB9UjDStAfFBAoDFHwd1HL5VQCNQdqEc
/9lZDApqWuCPadZN+pGouqLysesIYsNxUhJ7dtWOWHl0vs7/3qkWmWun/2uOJMQh
ra2u8nA9g91FbOobWqjrDd6x3ZJoGQf4zLqjmn/P514gb697788e573WN/MpQ5XI
Fl7aM2d6/GJiq6LC9T2gSUW4rbPBiqOCeiUx7Kd/sVm41p9TOA7fEG4bYddCfDsN
xaQJH6VRK3NOuBUGeL+iQEVF5Xs6Yp+U+jwvv2M5Lel3EqAYo5xXTx4ls0xaxDCu
fudcAh8CMMqx3fguSb7Mi31WlnZpk0fDuWQVNKyDP7lYpwc4nCCGNKCj622ZSocH
AcQmX28L8pJdLYacv9pU3jPy4fHcQYvmTavTqowGnM08RGVtaSBNYXJpZSBPYmVu
b3VyIChsb3ZlciBvZiBjb2RpbmcpIDxkZW1pb2Jlbm91ckBnbWFpbC5jb20+wsF4
BBMBAgAiBQJafgNKAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRCyiLVf
/5wiwYa/EACv8a2+MMou9cSCNoZBQaU+fTmyzft9hUE+0d5W2UY1RY3OsjFIzm9R
/4SVccfsqOYLEo+S0vQMIIIqFEq3FCpXXwPzyimotps05VA8U3Bd7yseojFygOgK
sAMOAee2RCaDDOnoJue01dfZMzzHPO/TVdp3OvnpWipfv5G1Xg96rwbhMLE3tg6N
xwAHa31Bv4/Xq8CJOoIWvx6fcmZQpz01/lSvsYn0KrfEbTKkuUf0vM9JrCTCP2oz
VNN5BYzqaq2M4r+jmSyeXLim922VOWqGkUEQ85BSEemqrRS06IU6NtEMsF8EWt/b
hWjk/9GDKTcnpdJHTrMxTspExBiNrvpI2t+YPU5B/dJJAUxvmhFrbSIbdB8umBZs
I3AMYrEmpAbh5x7jEjoskUC7uN3o9vpg1oCLS2ePDLtAtyBtbHnkA4xGD7ar8mem
xpH9lY/i+sC6CyyIUWcUDnnagKyJP0m9ks0GLsTeOCA0bft2XA6rD6aaCnMUsndT
ctrab42CV5XypjmC4U1rPJ8JQJUh1/3P48/8sMH+3krxpJ06KNWNFaUbaMTGiltZ
7x9DngklSYrX0T+2G4kVXNmjaljwkoLahwLla2gUWwBSyofXdqyhQdwZsp01KXNQ
UCyT/Pg+aDcm/E7OMV3d4lf7g/CSxiX2GSEe6BlhSz+Lmd7ZJ3g32M1ARGVtaSBN
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
EtJuZYM5blWncBOJCoWMnBEcTEo/viU3GgcVRw=3D=3D
=3Dx94R
-----END PGP PUBLIC KEY BLOCK-----

--------------goDONf81kOFC7EOsf0Xr8A9K--

--------------tOYun1M94nzSIWVJ9OcGMvmL--

--------------EoauF1oUBJMzNuBcDIx4GsTe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmmFI0gACgkQszaHOrMp
8lNb+RAAo0Rs54FnLcwqaSLgByH/JxaviNODAW1C0YE1HRcsodJ+RZr/8ilNmIGH
DvptNIya0FKnYF0xn2KMqRoYbYhaZJ7m6817JjWvofuqX/qHny6K0Pln+MH9Zosx
+cqZRjj8hOugjGD7P16le3YCXZs8KWuxsK31344+mNQq/lhqNUuaNZODuG0BsZno
5kLFCiZLxgAdQCSOkUyMhg+STWqz8P8+Rr/P9RjHw/avZNmh8IlMW1IYodsCAvlm
IRoKQc94M4mw79RZ4wMH7rNrWi+nfAxzWQ9hqbmTB+gQWx/Y6d4oLZsowFu3pBHX
R3eNm9Lke4tP+2ulv0TDIJXw/aY3rN/pFAdIiZ1J0+PZqMxjcLPZ1r/GT4ZaUI1O
GFoqZr4Z1Mz0layBujhVBIs9HCNFyPzGEarQWApQf1OFex6PPV0JoQjs9sslw+uv
moNQOCEVyRPNrPK9pkuZZnO+8mFkph2rpdnbFVv+yCrv8Pk81ftDD8++MrQixQwU
asXzG2UkqKu3qF0ysw/+goMAvjz9RxuNkYl0m4Z8whzqda/cgVUP/crxDAZOK7/M
KXUpchDHQ8SD5rlY06oJbBNCUZDft0DkXCrGVmvJOdmQzFX5xxQ1FDg9Y4cXDnQQ
p/p5x3pSKgWifFEkOpCvigF0WSYNj1ED83flBYWOenVgG7gj0qM=
=PuSi
-----END PGP SIGNATURE-----

--------------EoauF1oUBJMzNuBcDIx4GsTe--

